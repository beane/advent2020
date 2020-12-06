class Group
  attr_accessor :answers
  def initialize(answers)
    @answers = answers.map(&:chars)
  end

  def uniq
    answers.flatten.uniq
  end

  def shared_answers
    # & here is the set intersection operator
    answers.reduce { |acc, answer| acc = acc & answer }
  end

  def empty?
    answers.first.empty?
  end
end

# part 1
p File.readlines('input', chomp: true)
  .chunk_while { |a,b| !a.empty? && !b.empty? } # produces an array of arrays
  .map { |answers| Group.new(answers) }
  .reject { |group| group.empty? }
  .map(&:uniq)
  .map(&:count)
  .sum

# part 2
p File.readlines('input', chomp: true)
  .chunk_while { |a,b| !a.empty? && !b.empty? } # produces an array of arrays 
  .map { |answers| Group.new(answers) }
  .reject { |group| group.empty? }
  .map(&:shared_answers)
  .map(&:count)
  .sum
