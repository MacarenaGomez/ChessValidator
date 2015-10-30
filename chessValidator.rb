require 'pry'

#idea! Hacer un módulo para añadirle funcionalidades comunes a la reina


class Piece

  @@board = [[:wR,nil,nil,nil,nil,nil,nil,:wR],
             [nil,nil,nil,nil,nil,nil,nil,nil],
             [nil,nil,nil,nil,nil,nil,nil,nil],
             [nil,nil,nil,nil,nil,nil,nil,nil],
             [nil,nil,nil,nil,nil,nil,nil,nil],
             [nil,nil,nil,nil,nil,nil,nil,nil],
             [nil,nil,nil,nil,nil,nil,nil,nil],
             [nil,nil,nil,nil,nil,nil,nil,nil]]

  def initialize color, current_position
    @current_position = current_position
    @color = color
  end

  def move destination
    validation = (move_is_valid? destination) && (check_position destination)

    if validation
        @current_position = destination
    end

    show_validation validation
  end

  def show_validation validation
   
    if (validation)
      puts "LEGAL" 
    else
      puts "ILEGAL"
    end

  end 

  def check_position destination
  end

  def move_is_valid? destination
  end

end

class Rook < Piece

  def initialize color, current_position
    @current_position = current_position
    @color = color
  end

  def move destination
    validation = (move_is_valid? destination) && (check_position destination)

    if validation
        @current_position = destination
    end

    show_validation validation
  end

  def show_validation validation
   
    if (validation)
      puts "LEGAL" 
    else
      puts "ILEGAL"
    end

  end 

  def check_position destination
  
    index = (@current_position[0] == destination[0])? @current_position[0] : @current_position[1]
    piece = @@board[index].find {|position| position != nil}

    if ( !piece.nil? ) 
      validation = piece.to_s.split("")[0] != @color
    else
      validation = true
    end
  
  end

  def move_is_valid? destination
  
    (@current_position[0] == destination[0] || @current_position[1] == destination[1]) 
  
  end
end 

mybR = Rook.new "b", [8,0]
mybR.move [0,0]


binding.pry