require_relative 'spec_helper'
require_relative '../lib/turn'

describe Turn do
  before do
    table = Table.new
    @robot = Robot.new(row: 2, column: 4, direction: "WEST", table: table)
    @turn = Turn.new(@robot)
  end

  describe "#initialize" do
    it "initializes turn with attributes from robot instance" do
      expect(@turn.robot).to eq @robot
    end
  end

  describe ".turn_left" do
    let(:left) { @turn.turn_left(@robot.direction) }

    it "turns robot to the LEFT without changing row & column" do
      expect(left).to eq "SOUTH"
      expect(@robot.row).to eq 2
      expect(@robot.column).to eq 4
    end
  end

  describe ".turn_right" do
    let(:right) { @turn.turn_right(@robot.direction) }

    it "turns robot to the RIGHT without changing row & column" do
      expect(right).to eq "NORTH"
      expect(@robot.row).to eq 2
      expect(@robot.column).to eq 4
    end
  end
end
