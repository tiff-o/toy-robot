class Turn
  attr_accessor :row, :column, :direction

  def initialize(row, column, direction)
    # initialise turn with current position
    @row = row
    @column = column
    @direction = direction
  end

  def turn_left(direction)
    # update direction once turn_left executed
    @new_directions = { NORTH: "WEST", SOUTH: "EAST", EAST: "NORTH", WEST: "SOUTH" }

    @direction = @new_directions[:"#{direction}"]
    @position = "#{@row}, #{@column}, #{@direction}"
  end

  def turn_right(direction)
    # update direction once turn_right executed
    @new_directions = { NORTH: "EAST", SOUTH: "WEST", EAST: "SOUTH", WEST: "NORTH" }

    @direction = @new_directions[:"#{direction}"]
    @position = "#{@row}, #{@column}, #{@direction}"
  end
end
