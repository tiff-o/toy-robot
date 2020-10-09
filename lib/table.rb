class Table
  attr_reader :width, :length

  # constraint: 5 x 5 units
  def initialize(width = 5, length = 5)
    @width = width
    @length = length
  end

  # check if proposed position is within constraints
  def on_table?(row, column)
    row.between?(0, @length) && column.between?(0, @width)
  end
end
