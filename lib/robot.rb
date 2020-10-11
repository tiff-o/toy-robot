class Robot
  attr_reader :row, :column, :direction, :table

  def initialize(table:)
    # create robot with nil position
    @table = table
    @row = nil
    @column = nil
    @direction = nil
  end

  def place(row:, column:, direction:)
    # place if on table
    raise PositionError unless @table.on_table?(row, column) # @table is the table used to initialize robot

    @row = row
    @column = column
    @direction = direction
  end

  def can_move(row:, column:, direction:)
    # check if robot can move
    raise PlacedError unless placed?

    # must be placed first
    place(row: row, column: column, direction: direction)
    # if already placed, allow position to be updated (robot can move)
  end

  def placed?
    # check if values are nil
    @row && @column && @direction
  end

  class PositionError < StandardError
    def message
      "Position not on table"
    end
  end

  class PlacedError < StandardError
    def message
      "Robot must be placed first"
    end
  end
end

# cannot take command if no valid place position
# place must be first command
# place can be called again
