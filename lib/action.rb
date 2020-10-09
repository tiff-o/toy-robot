class Action
  def initialize(robot)
    @robot = robot
  end

  def move
    case @robot.direction
    when "WEST"
      @robot.column = @robot.column - 1
    when "EAST"
      @robot.column = @robot.column + 1
    when "NORTH"
      @robot.row = @row + 1
    when "SOUTH"
      @robot.row = @row + 1
    end
  end
end
