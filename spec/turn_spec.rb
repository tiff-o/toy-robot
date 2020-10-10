require_relative 'spec_helper'
require_relative '../lib/turn'
require_relative '../lib/error/position_error'
require_relative '../lib/error/placed_error'

describe Turn do
  before do
    table = Table.new
    @robot = Robot.new(row: 2, column: 4, direction: "WEST", table: table)
    @turn = Turn.new(@robot)
  end

  describe "#initialize" do
    it "should initiate turn with attributes from robot" do
      expect(@turn.robot).to eq @robot
      expect(@turn.robot.placed).to eq false
    end
  end

  describe ".turn_left" do
    let(:left) { @turn.turn_left(@robot.direction) }

    it "should turn robot LEFT without changing position" do
      @robot.placed = true

      expect(left).to eq "SOUTH"
      expect(@robot.row).to eq 2
      expect(@robot.column).to eq 4
    end

    it "should raise placed error if robot hasn't been placed first" do
      @robot.placed = false
      @turn = Turn.new(@robot)

      expect { @turn.turn_left(@robot.direction) }.to raise_error(PlacedError)
    end
  end

  describe ".turn_right" do
    let(:right) { @turn.turn_right(@robot.direction) }

    it "should turn robot the RIGHT without changing position" do
      @robot.placed = true

      expect(right).to eq "NORTH"
      expect(@robot.row).to eq 2
      expect(@robot.column).to eq 4
    end

    it "should raise placed error if robot hasn't been placed first" do
      @robot.placed = false
      @turn = Turn.new(@robot)

      expect { @turn.turn_right(@robot.direction) }.to raise_error(PlacedError)
    end
  end
end
