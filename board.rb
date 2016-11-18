class Board
  attr_accessor :grid

  def self.default_grid
    board = Array.new(9) { Array.new(9) { Tile.new } }
    Board.new(board)
  end

  def initialize(grid)
    @grid = grid
    populate
  end

  def []=(pos, val)
    row, col = pos
    grid[row][col] = val
  end

  def [](pos)
    row, col = pos
    grid[row][col]
  end

  def populate
    positions = []
    grid.each_index do |row|
      grid[0].each_index do |col|
        positions << [row, col]
      end
    end

    positions.each do |pos|
      self[pos].board = grid
      self[pos].position = pos
    end

    bombs_idx = positions.sample(10)
    bombs_idx.each do |pos|
      self[pos].add_bomb
    end

  end
end
