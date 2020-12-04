TREE = '#'
HILL = File.readlines('input').map(&:strip)

prod = [1,3,5,7,1].zip([1,1,1,1,2]).map do |right, down|
  column = 0
  c = 0.upto(HILL.length-1).count do |row|
    next unless row % down == 0

    line = HILL[row]
    tree = line[column] == TREE
    column = (column + right) % line.length
    tree
  end
  c
end.reduce(1, &:*)
puts prod

