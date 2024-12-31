#!/usr/bin/env ruby
lines = File.read('../../input/day_2.txt').split("\n")

def is_valid(line)
    line = line.split(' ').map { |x| x.to_i }
    decreasing = line.each_cons(2).all? { |a, b| a > b }
    increasing = line.each_cons(2).all? { |a, b| a < b }
    difference = line.each_cons(2).all? { |a, b| (a - b).abs.between?(1, 3) }
    (decreasing || increasing) && difference
end

puts lines.map { |line| is_valid(line) }.count(true)