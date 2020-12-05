class BoardingPass
  attr_reader :row_code, :column_code
  def initialize(ticket_code)
    @row_code = ticket_code[0..6].split('')
    @column_code = ticket_code[7..-1].split('')
  end

  def row
    row_code.map { |code| code == 'F' ? 0 : 1 }.join.to_i(2)
  end

  def column
    column_code.map { |code| code == 'L' ? 0 : 1 }.join.to_i(2)
  end

  def seat_id
    row * 8 + column
  end
end
 
# part 1
puts File.readlines('input')
  .map(&:strip)
  .map { |code| BoardingPass.new(code).seat_id }
  .max

# part 2
seat_ids = File.readlines('input')
  .map(&:strip)
  .map { |code| BoardingPass.new(code).seat_id }
  .sort

puts (seat_ids.min..seat_ids.max).to_a - seat_ids

