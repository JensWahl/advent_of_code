#!/usr/bin/env ruby

data = File.read('../../input/day_1a.txt')

# Split each line into an array of arrays. Each line is an array of strings
lines = data.split("\s") # Split by whitespace
lines = lines.map { |x| x.to_i} # Convert each element to integer
lines = lines.each_slice(2).to_a # Split into pairs
first_numbers = lines.map { |pair| pair[0] }.sort
second_numbers = lines.map { |pair| pair[1] }.sort

puts first_numbers[0..3].inspect
puts second_numbers[0..3].inspect

diff = first_numbers.zip(second_numbers).map { |a, b| (a - b).abs}

puts diff.sum()
