count = File.readlines('input').count do |line|
  rule, letter, password = line.split(' ', 3)
  i, j = rule.split('-')
  letter = letter[0...-1]
  i = i.to_i - 1
  j = j.to_i - 1
  (password[i] == letter) ^ (password[j] == letter) # bitwise xor. sorry...
  # password.count(letter).between?(min,max)
end
puts count
