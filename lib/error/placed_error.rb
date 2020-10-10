class PlacedError < StandardError
  attr_reader :message

  def initialize
    super
    @message = "Robot must be placed first"
  end
end
