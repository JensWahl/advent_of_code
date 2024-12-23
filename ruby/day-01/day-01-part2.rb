#!/usr/bin/env ruby
data = File.read('../../input/day_1a.txt')

# Split each line into an array of arrays. Each line is an array of strings
lines = data.split("\s") # Split by whitespace
lines = lines.map { |x| x.to_i} # Convert each element to integer
lines = lines.each_slice(2).to_a # Split into pairs
first_numbers = lines.map { |pair| pair[0] } # Create array from first column
second_numbers = lines.map { |pair| pair[1] } # Create array from second column

frequency_count = Hash.new(0)
second_numbers.each { |num| frequency_count[num] += 1 }
first_numbers = first_numbers.uniq

# Loop over each number in first numbers and check if it's in the second
sum = 0
first_numbers.each do |num|
  sum += frequency_count[num] * num
end

puts sum
