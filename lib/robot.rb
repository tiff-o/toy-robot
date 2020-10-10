class Robot
  attr_accessor :row, :column, :direction, :table, :placed

  def initialize(table:, direction: "NORTH", row: 0, column: 0, placed: false)
    # create robot with origin(0,0) position
    @row = row
    @column = column
    @direction = direction
    @table = table
    @placed = placed
  end

  def place(row:, column:, direction:)
    # place if on table
    raise PositionError unless @table.on_table?(row, column)

    # set current position
    @row = row
    @column = column
    @direction = direction
    @placed = true
  end

  def report(row, column, direction)
    # REPORT - announces X,Y & F of robot
    "#{row}, #{column}, #{direction}"
  end
end

# cannot take command if no valid place position
# place must be first command
# place can be called again
