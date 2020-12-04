REQUIRED_FIELDS = ['byr','iyr','eyr','hgt','hcl','ecl','pid'].sort
FIELDS = REQUIRED_FIELDS + ['cid']
VALID_EYE_COLORS = ['amb','blu','brn','gry','grn','hzl','oth']
FILE = File.readlines('input').map &:strip

passports = []
current_passport = []

def build_passport(lines)
  passport = {}
  lines.each do |line|
    pairs = line.split(' ')
    pairs.each do |pair|
      key, val = pair.split(':')
      passport[key] = val
    end
  end
  passport
end

def valid?(passport)
  REQUIRED_FIELDS.all? { |field| passport[field] } && all_fields_valid?(passport)
end

def all_fields_valid?(passport)
  return false unless passport['byr'].to_i.between?(1920, 2002)
  return false unless passport['iyr'].to_i.between?(2010, 2020)
  return false unless passport['eyr'].to_i.between?(2020, 2030)
  hgt_unit = passport['hgt'][-2..-1]
  if hgt_unit == 'in'
    return false unless passport['hgt'][0...-2].to_i.between?(59, 76)
  elsif hgt_unit == 'cm'
    return false unless passport['hgt'][0...-2].to_i.between?(150, 193)
  else
    return false
  end
  
  return false unless passport['hcl'] =~ /^#[a-f0-9]{6}$/
  return false unless VALID_EYE_COLORS.include?(passport['ecl'])
  return false unless passport['pid'] =~ /^[0-9]{9}$/

  true
end

FILE.each_with_index do |line, i|
  if line.empty? || i == FILE.length-1
    passports << build_passport(current_passport)
    current_passport = []
    next
  end

  current_passport << line
end

puts passports.count { |passport| valid?(passport) }
