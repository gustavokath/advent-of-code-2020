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
    valid = true
    @fields.each do |name, value|
      valid = false if name != :cid && value.nil?
    end
    p valid
    p '-----------'
    valid
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
      p "#{name}: #{value}"
      passport.fields[name.to_sym] = value
    end
  end
end

valid+= 1 if passport.valid?

p valid

