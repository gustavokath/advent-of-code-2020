class Passport
  attr_accessor :fields
  def initialize
    @fields = {
      byr: nil,
      iyr: nil,
      eyr: nil,
      hgt: nil,
      hcl: nil,
      ecl: nil,
      pid: nil,
      cid: nil
    }
  end

  def valid?
    return valid_interval?(@fields[:byr].to_i, 1920, 2002) &&
      valid_interval?(@fields[:iyr].to_i, 2010, 2020) &&
      valid_interval?(@fields[:eyr].to_i, 2020, 2030) &&
      valid_height?(@fields[:hgt]) &&
      hexcolor?(@fields[:hcl]) &&
      oneof?(@fields[:ecl]) &&
      passport?(@fields[:pid])
  end

  def valid_interval?(field, min, max)
    field >= min && field <= max
  end

  def valid_height?(field)
    return false if field.nil?
    value = field[0..-2].to_i
    if(field[-2..-1] == 'in')
      return valid_interval?(value, 59, 76)
    else
      return valid_interval?(value, 150, 193)
    end
  end

  def hexcolor?(field)
    return false if field.nil?
    field.match?(/^#[0-9a-f]{6}$/)
  end

  def oneof?(field)
    return false if field.nil?
    hash = {amb: true, blu: true, brn: true, gry: true, grn: true, hzl: true, oth: true}
    return hash.key?(field.to_sym)
  end

  def passport?(field)
    return false if field.nil?
    field.match?(/^[0-9]{9}$/)
  end
end

valid = 0
passport = Passport.new
$stdin.each_line do |line|
  line = line.chomp
  if line.empty?
    valid+= 1 if passport.valid?
    passport = Passport.new
  else
    line_attr = line.split(' ').map{ |item| item.split(':') }
    line_attr.each do |name, value|
      passport.fields[name.to_sym] = value
    end
  end
end

valid+= 1 if passport.valid?

p valid

