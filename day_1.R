library(data.table)

#### Part 1 ####
# Read input data
data = fread('input/day_1a.txt')
x = sort(data$V1)
y = sort(data$V2)

# Compare the difference
sum(abs(x - y))
# 1603498

#### Part 2 ####
# Row-wise, count the number of times V1[i] is in V2 and multiply by V1[i]
data[, V3 := sum(V1 == data$V2) * V1 , .I]
data[, sum(V3)]
# 25574739
