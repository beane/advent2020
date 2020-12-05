class BoardingPass
  attr_reader :seat_id
  def initialize(ticket_code)
    @seat_id = ticket_code
      .gsub('F', '0')
      .gsub('B', '1')
      .gsub('L', '0')
      .gsub('R', '1')
      .to_i(2)
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

