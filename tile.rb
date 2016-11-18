require 'byebug'
class Tile

  DIRECTIONS = [
    [-1, -1], [-1, 0], [-1, 1],
    [0, -1],  [0, 1],
    [1, -1], [1, 0], [1, 1]
  ]

  attr_accessor :board, :position

  def initialize
    @bomb = false
    @flagged = false
    @revealed = false
    @board = nil
    @position = nil
  end

  def reveal
    @revealed = true
    puts 'Blew up! Game Over' if @bomb
  end

  def flag
    @flagged = true
  end

  def handle_instruction(pos, instruction)
    instruction.downcase!
    if instruction.include?('f')
      flag
    elsif instruction.include?('r')
      reveal
    end
  end

  def neighbors
    # debugger
    x_cord = @position[0]
    y_cord = @position[1]
    neighbors = []

    DIRECTIONS.each do |offset|
      new_x = x_cord + offset[0]
      new_y = y_cord + offset[1]
      next unless in_range?([new_x, new_y])
      debugger
      neighbors << [new_x, new_y]
    end
    neighbors
  end

  def in_range?(pos)
    pos.none? { |num| num < 0 }
  end

  def neighbor_bomb_count

  end

  def add_bomb
    @bomb = true
  end
end
