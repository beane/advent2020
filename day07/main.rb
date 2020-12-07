require 'set'
require 'pp'

# part 1
bags = Hash.new { |h,k| h[k] = Set.new }

File.readlines('input', chomp: true).each do |full_line|
  line = full_line
    .delete_suffix(" bag.")
    .delete_suffix(" bags.")
  container, contained = line.split(/ bags contain /)
  contained
    .gsub(/\d+ /, '') # numbers bad
    .split(/ bags?, /)
    .each { |contained| bags[contained] << container }
end

def container_bags(bags, search_term)
  bags[search_term].map { |color| container_bags(bags, color) << color }
end

# this array is fucked up nested but flatten will save us
p container_bags(bags, 'shiny gold').flatten.uniq.count

# part 2
bags = Hash.new { |h,k| h[k] = [] }

File.readlines('input', chomp: true).each do |full_line|
  line = full_line
    .delete_suffix(" bag.")
    .delete_suffix(" bags.")
  container, contained = line.split(/ bags contain /)
  contained
    .split(/ bags?, /)
    .each do |contained|
      count, contained_color = contained.split(/ /, 2)
      bags[container].append([contained_color, count.to_i])
    end
end

def count_contained_bags(bags, search_term)
  bags[search_term].map do |color, count|
    count + count * count_contained_bags(bags, color)
  end.sum
end

p count_contained_bags(bags, 'shiny gold')
