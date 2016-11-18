class Minesweeper

  def initialize(board)
    @board = board
  end

  def play
    until game_over?
      render
      take_turn
    end
  end

  def take_turn
    position = get_position
    instruction = get_instruction
    selected_tile = board[pos]
    selected_tile.handle_instruction(position, instruction)
  end

  def get_position
    pos = nil

    until pos && valid_pos?(pos)
      puts "Enter a position"
      pos = parse_position(gets.chomp)
    end

    pos
  end

  def parse_position(input)
    x_cord = input[/^\d/].to_i
    y_cord = input[/\d$/].to_i
    [x_cord, y_cord]
  end


  def get_instruction
    instruction = nil

    until instruction && valid_instruction?(instruction)
      puts "Press F to flag, R to reveal"
      instruction = gets.chomp
    end

    instruction
  end

  def valid_pos?(pos)
    # row_range = "[0-#{board.size}]"
    # col_range = "[0-#{board[0].size}]"
    # pos =~ /#{row_range},#{col_range}/
    true
  end

  def valid_instruction?(instruction)
    true
  end

  def game_over?

  end

  def render
    board.render
  end

end
