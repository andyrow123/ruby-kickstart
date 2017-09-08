# Write a method, spiral_access, that takes a 2d square array (an array of arrays)
# and a block, and calls the block for each of the elements, in spiral order.
#
# HINT: This method is probably best sovled recursively
#
# Example:
# two_d = [
#   [ 1,  2,  3,  4, 5],
#   [16, 17, 18, 19, 6],
#   [15, 24, 25, 20, 7],
#   [14, 23, 22, 21, 8],
#   [13, 12, 11, 10, 9],
# ]
# order = []
# spiral_access two_d do |i|
#   order << i
# end
# order # => [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25]
  def spiral_access(arrays, iteration=0, &block)
    y_max = arrays.length - 1
    x_max = arrays.first.length - 1

    # base step
    return if y_max/2 < iteration || x_max/2 < iteration

    # top row
    # 1st Pass: 0.upto(4) do
    iteration.upto x_max-iteration do |x|
      # 1st Pass(1): arrays[0][0]
      # 1st Pass(2): arrays[0][1]
      # 1st Pass(3): arrays[0][2]
      # 1st Pass(4): arrays[0][3]
      # 1st Pass(5): arrays[0][4]
      block.call arrays[iteration][x]
    end

    # right column
    # 1st Pass: 1.upto(4) do
    (iteration + 1).upto y_max-iteration do |y|
      # 1st Pass(1): arrays[1][4]
      # 1st Pass(1): arrays[2][4]
      # 1st Pass(1): arrays[3][4]
      # 1st Pass(1): arrays[4][4]
      block.call arrays[y][x_max-iteration]
    end

    # bottom row
    # 1st Pass: 3.downto(0) do
    (x_max - 1 - iteration).downto iteration do |x|
      # 1st Pass(1): arrays[4][3]
      # 1st Pass(1): arrays[4][2]
      # 1st Pass(1): arrays[4][1]
      # 1st Pass(1): arrays[4][0]
      block.call arrays[y_max-iteration][x]
    end

    # left column
    # 1st Pass: 3.downto(1) do
    (y_max - 1 - iteration).downto iteration+1 do |y|
      # 1st Pass(1): arrays[3][0]
      # 1st Pass(1): arrays[2][0]
      # 1st Pass(1): arrays[1][0]
      block.call arrays[y][iteration]
    end

    # recursive step
    # 1st Pass: spiral_access arrays, 1
    spiral_access arrays, iteration+1, &block
  end

two_d = [
  [ 1,  2,  3,  4, 5],
  [16, 17, 18, 19, 6],
  [15, 24, 25, 20, 7],
  [14, 23, 22, 21, 8],
  [13, 12, 11, 10, 9],
]

order = []
spiral_access two_d do |i|
  order << i
end