class Action
  attr_reader :robot

  def initialize(robot)
    @robot = robot
  end

  def move
    raise PlacedError unless @robot.placed

    if @robot.direction == "NORTH" && @robot.row.between?(0, 4)
      @robot.row += 1
    elsif @robot.direction == "SOUTH" && @robot.row.between?(1, 5)
      @robot.row -= 1
    elsif @robot.direction == "EAST" && @robot.column.between?(0, 4)
      @robot.column += 1
    elsif @robot.direction == "WEST" && @robot.column.between?(1, 5)
      @robot.column -= 1
    else
      begin
        raise PositionError
      rescue PositionError => e
        "Try again, #{e.message.downcase}."
      end
    end
  end
end
