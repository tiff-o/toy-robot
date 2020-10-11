module Action
  def self.turn_left(robot)
    new_direction = { "NORTH" => "WEST", "SOUTH" => "EAST", "EAST" => "NORTH", "WEST" => "SOUTH" }

    robot.can_move(row: robot.row, column: robot.column, direction: new_direction[robot.direction])
  end

  def self.turn_right(robot)
    new_direction = { "NORTH" => "EAST", "SOUTH" => "WEST", "EAST" => "SOUTH", "WEST" => "NORTH" }

    robot.can_move(row: robot.row, column: robot.column, direction: new_direction[robot.direction])
  end

  def self.move(robot)
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
  end

  def self.report(robot)
    robot.can_move(row: robot.row, column: robot.column, direction: robot.direction)
    "#{robot.row}, #{robot.column}, #{robot.direction}".strip
  end
end
