class Position
  attr_accessor :min, :max

  def initialize(min = 0, max = 5)
    @min = min
    @max = max
  end
end
