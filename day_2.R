# Read data
data = read.delim('input/day_2.txt', header = FALSE)[[1]]

#### Part 1 ####
process_string_part1 = function(x) {

    x = strsplit(x, ' ')[[1]] |> as.integer()

    # Compare the difference between x[i] and x[i+1]
    diff = head(x, -1) - tail(x, -1)

    # Are any differences not between 1 and 3?
    # Do we observe more than one sign?
    if (any(abs(diff) > 3 | abs(diff) < 1)) return(FALSE)
    if (length(unique(sign(diff))) != 1) return(FALSE)

    return(TRUE)

}

data |> sapply(process_string_part1) |> sum()
# 502


#### Part 2 ####
process_string_part2 = function(x) {

    check_subvector = function(x) {
        diff = head(x, -1) - tail(x, -1)
        if (any(abs(diff) > 3 | abs(diff) < 1)) return(FALSE)
        if (length(unique(sign(diff))) != 1) return(FALSE)
        return(TRUE)
    }

    x = strsplit(x, ' ')[[1]] |> as.integer()
    ok = check_subvector(x)

    # Are any differences not between 1 and 3, and do we observe the difference more than once?
    # Do we observe both signs more than once?
    for (i in 1:(length(x) - 1)) {
        # Check difference between x[i] and x[i+1]
        diff = x[i] - x[i+1]
        if (diff > 3 | diff < 1) {
            # should we remove x[i] or x[i+1]?
            ok = ok | check_subvector(x[-i])
            ok = ok | check_subvector(x[-(i+1)])
        }
    }
    return(ok)

}

data |> sapply(process_string_part2) |> sum()
re[!re]

# 530
