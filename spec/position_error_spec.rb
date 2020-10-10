require_relative 'spec_helper'
require_relative '../lib/error/position_error'

describe PositionError do
  describe "#initialize" do
    it "should raise position error with correct message" do
      expect { raise PositionError }.to raise_error("Position not on table")
    end
  end
end
