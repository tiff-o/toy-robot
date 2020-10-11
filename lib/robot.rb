class Robot
  attr_reader :row, :column, :direction, :table

  def initialize(table:)
    @table = table
    @row = nil
    @column = nil
    @direction = nil
  end

  def place(row:, column:, direction:)
    raise PositionError unless @table.on_table?(row, column)

    @row = row
    @column = column
    @direction = direction
  end

  def can_move(row:, column:, direction:)
    raise PlacedError unless placed?

    place(row: row, column: column, direction: direction)
  end

  def placed?
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
