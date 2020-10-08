class Place
  attr_accessor :origin

  def initialize(origin=0)
    # can place more than once if robot exists
    # start with origin(0,0) position as default
    @origin = origin
  end

  def place(row, column, direction)
    # place if on table
    row.between?(0,5) && column.between?(0,5)
    # set current position
    @position = "#{row}, #{column}, #{direction}"
  end
end

# Place.new(robot, position)
