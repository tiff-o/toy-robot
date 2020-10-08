class Action
  attr_accessor :row, :column, :direction

  def initialize(row, column, direction)
    @row = row
    @column = column
    @direction = direction
  end

  def move(row, column, direction)
    case direction
    when "WEST"
      position = "#{@row}, #{@column - 1}, #{@direction}"
    when "EAST"
      position = "#{@row}, #{@column + 1}, #{@direction}"
    when "NORTH"
      position = "#{@row + 1}, #{@column}, #{@direction}"
    when "SOUTH"
      position = "#{@row - 1}, #{@column}, #{@direction}"
    end
  end
end
