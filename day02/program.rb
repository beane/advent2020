count = File.readlines('input').count do |line|
  rule, letter, password = line.split(' ', 3)
  i, j = rule.split('-').map(&:to_i)
  letter = letter[0...-1]
  (password[i-1] == letter) ^ (password[j-1] == letter) # bitwise xor. sorry...
  # password.count(letter).between?(min,max)
end
puts count
