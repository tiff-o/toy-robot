class Table
  attr_reader :width, :length

  def initialize(width: 5, length: 5)
    @width = width
    @length = length
  end

  def on_table?(row, column)
    row.between?(0, @length) && column.between?(0, @width)
  end
end
