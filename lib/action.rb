require_relative 'app'

class Action
  attr_reader :robot

  def initialize(robot)
    @robot = robot
  end

  def move
    if @robot.placed
      if @robot.direction == "NORTH" && @robot.row.between?(0, 4)
        @robot.row += 1
      elsif @robot.direction == "SOUTH" && @robot.row.between?(1, 5)
        @robot.row -= 1
      elsif @robot.direction == "EAST" && @robot.column.between?(0, 4)
        @robot.column += 1
      elsif @robot.direction == "WEST" && @robot.column.between?(1, 5)
        @robot.column -= 1
      else
        raise "position not on table" # TODO: ERROR MESSAGES
      end
    else
      raise "robot needs to be placed first"
    end
  end
end

# @table = Table.new
# @robot = Robot.new(row: 5, column: 5, direction: "NORTH", table: @table)
# @action = Action.new(@robot)

# puts @action.move
