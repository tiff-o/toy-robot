module Action
  # self = Action.new
  def self.turn_left(robot)
    # update direction once turn_left executed
    new_direction = { "NORTH" => "WEST", "SOUTH" => "EAST", "EAST" => "NORTH", "WEST" => "SOUTH" }

    robot.can_move(row: robot.row, column: robot.column, direction: new_direction[robot.direction])
  end

  def self.turn_right(robot)
    # update direction once turn_right executed
    new_direction = { "NORTH" => "EAST", "SOUTH" => "WEST", "EAST" => "SOUTH", "WEST" => "NORTH" }

    robot.can_move(row: robot.row, column: robot.column, direction: new_direction[robot.direction])
  end

  def self.move(robot)
    # MOVE - move one position in facing direction
    raise Robot::PlacedError unless robot.placed?
    destination = case robot.direction
                  when "NORTH"
                    { row: robot.row + 1, column: robot.column }
                  when "SOUTH"
                    { row: robot.row - 1, column: robot.column }
                  when "EAST"
                    { row: robot.row, column: robot.column + 1 }
                  when "WEST"
                    { row: robot.row, column: robot.column - 1 }
                  end
    robot.can_move(row: destination[:row], column: destination[:column], direction: robot.direction)
    # can_move checks if position is on table & moves position if it is
  end

  def self.report(robot)
    # REPORT - announces X,Y & F of robot
    robot.can_move(row: robot.row, column: robot.column, direction: robot.direction)
    "#{robot.row}, #{robot.column}, #{robot.direction}".strip
  end
end
