require_relative 'spec_helper'
require_relative '../lib/turn'

describe Turn do
describe ".turn_left" do
    let(:row) { 2 }
    let(:column) { 4 }
    let(:direction) { "NORTH" }
    let(:robot) { Turn.new(row, column, direction) }
    let(:left) { robot.turn_left(direction) }

    it "turns robot to the LEFT without changing row & column" do
      expect(left).to eq "2, 4, WEST"
    end
  end

  describe ".turn_left" do
    let(:row) { 4 }
    let(:column) { 3 }
    let(:direction) { "WEST" }
    let(:robot) { Turn.new(row, column, direction) }
    let(:left) { robot.turn_left(direction) }

    it "turns robot to the LEFT without changing row & column" do
      expect(left).to eq "4, 3, SOUTH"
    end
  end

  describe ".turn_right" do
    let(:row) { 2 }
    let(:column) { 2 }
    let(:direction) { "NORTH" }
    let(:robot) { Turn.new(row, column, direction) }
    let(:right) { robot.turn_right(direction) }

    it "turns robot to the RIGHT without changing row & column" do
      expect(right).to eq "2, 2, EAST"
    end
  end

  describe ".turn_right" do
    let(:row) { 4 }
    let(:column) { 3 }
    let(:direction) { "WEST" }
    let(:robot) { Turn.new(row, column, direction) }
    let(:right) { robot.turn_right(direction) }

    it "turns robot to the RIGHT without changing row & column" do
      expect(right).to eq "4, 3, NORTH"
    end
  end
end
