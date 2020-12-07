require 'set'

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

to_search = ["shiny gold"]
found = Set.new

until to_search.empty? do
  search = to_search.shift
  to_search.concat bags[search].to_a
  found.merge bags[search]
end

p found.count

# hot garbage below
#
# part 2
# bags = Hash.new { |h,k| h[k] = Hash.new(0) }
# 
# File.readlines('input', chomp: true).each do |full_line|
#   line = full_line
#     .delete_suffix(" bag.")
#     .delete_suffix(" bags.")
#   container, contained = line.split(/ bags contain /)
#   contained
#     .split(/ bags?, /)
#     .each do |contained|
#       count, bag = contained.split(/ /, 2)
#       bags[container][bag] += count.to_i
#     end
# end
# 
# to_search = [["shiny gold", 1]]
# found = Hash.new 0
# pp bags
# 
# until to_search.empty? do
#   search = to_search.shift
#   search_term, container_count = search
#   to_search.concat bags[search_term].to_a
#   bags[search_term].each { |color, count| found[color] += container_count * count }
#   print search_term, ' ', container_count
#   puts
#   pp found
# end
# 
# p found.values.sum
