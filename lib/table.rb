class Table
  attr_reader :width, :length
 # constraint: 5 x 5 units
  def initialize(width=5, length=5)
    @width = width
    @length = length
  end
end
