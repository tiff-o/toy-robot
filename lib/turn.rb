class Turn
  attr_reader :robot

  def initialize(robot)
    # initialise turn with current position
    @robot = robot
  end

  def turn_left(direction)
    # update direction once turn_left executed
    @new_directions = { NORTH: "WEST", SOUTH: "EAST", EAST: "NORTH", WEST: "SOUTH" }

    @robot.direction = @new_directions[:"#{direction}"]
  end

  def turn_right(direction)
    # update direction once turn_right executed
    @new_directions = { NORTH: "EAST", SOUTH: "WEST", EAST: "SOUTH", WEST: "NORTH" }

    @robot.direction = @new_directions[:"#{direction}"]
  end
end
