require_relative 'spec_helper'
require_relative '../lib/errors/placed_error'

describe PlacedError do
  describe "#initialize" do
    it "should raise placed error with correct message" do
      expect { raise PlacedError }.to raise_error("Robot must be placed first")
    end
  end
end
