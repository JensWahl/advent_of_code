require 'matrix'
lines = File.read('../../input/day_4.txt').split("\n")
regex = /(XMAS|SAMX)/ 

grid = lines.map { |line| line.split('') }
A = Matrix.rows(grid)
count_row = 0
count_col = 0
count_diag = 0
count_reverse_diag = 0

A.each_with_index do |element, row, col|
    # Scan row
    # 403 total matches
    count_row += A[row, col..(col + 3)].to_a.join.scan(regex).length
    if A[row, col..(col + 3)].to_a.join.scan(regex).length > 0
        puts "Row match: #{row}, #{col}, #{A[row, col..(col + 3)].to_a.join}"
    end

    # Scan column
    # 425 total matches
    count_col += A.column(col)[row..(row + 3)].to_a.join.scan(regex).length
    if A.column(col)[row..(row + 3)].to_a.join.scan(regex).length > 0
        puts "Col match: #{row}, #{col}, #{A.column(col)[row..(row + 3)].to_a.join}"
    end

    # Scan diagonal
    if row <= A.row_count - 3 && col <= A.column_count - 3
        # Extract 4 values along the diagonal starting at (row, col)
        diagonal = [A[row, col], A[row + 1, col + 1], A[row + 2, col + 2], A[row + 3, col + 3]]
        count_diag += diagonal.join.scan(regex).length
        if diagonal.join.scan(regex).length > 0
            puts "Diagonal match: #{row}, #{col}, #{diagonal.join}"
        end
    end

    # Scan reverse diagonal
    if row >= 3
        reverse_diagonal = [A[row, col], A[row - 1, col + 1], A[row - 2, col + 2], A[row - 3, col + 3]]
        count_reverse_diag += reverse_diagonal.join.scan(regex).length
        if reverse_diagonal.join.scan(regex).length > 0
            puts "Reverse diagonal match: #{row}, #{col}, #{reverse_diagonal.join}"
        end
    end
end

puts count_row
puts count_col
puts count_diag
puts count_reverse_diag 
puts count_row + count_col + count_diag + count_reverse_diag
