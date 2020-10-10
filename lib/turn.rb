class Turn
  attr_reader :robot

  def initialize(robot)
    # initialise turn with current position
    @robot = robot
  end

  def turn_left(direction)
    if @robot.placed # robot must have been placed first
      # update direction once turn_left executed
      @new_directions = { NORTH: "WEST", SOUTH: "EAST", EAST: "NORTH", WEST: "SOUTH" }

      @robot.direction = @new_directions[:"#{direction}"]
    else
      raise PlacedError unless @robot.placed
    end
  end

  def turn_right(direction)
    if @robot.placed # robot must have been placed first
      # update direction once turn_right executed
      @new_directions = { NORTH: "EAST", SOUTH: "WEST", EAST: "SOUTH", WEST: "NORTH" }

      @robot.direction = @new_directions[:"#{direction}"]
    else
      raise PlacedError unless @robot.placed
    end
  end
end
