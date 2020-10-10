class PositionError < StandardError
  attr_reader :message

  def initialize
    super
    @message = "Position not on table"
  end
end
