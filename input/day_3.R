library(stringr)
data = scan('input/day_3.txt', sep = NULL, what = character())
regex = 'mul\\((\\d{1,3}),(\\d{1,3})\\)'
res = str_match_all(data, regex)
sapply(res, \(x) {
    if (nrow(x) == 0) return(0)
    return(sum(as.numeric(x[, 2]) * as.numeric(x[, 3])))
}) |> sum()
#


