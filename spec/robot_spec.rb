require_relative 'spec_helper'
require_relative '../lib/robot'
require_relative '../lib/errors/position_error'
require_relative '../lib/errors/placed_error'

describe Robot do
  before do
    table = Table.new
    @robot = Robot.new(direction: "WEST", table: table)
  end

  describe "#initialize" do
    it "should create robot in default position (0, 0)" do
      expect(@robot.row).to eq 0
      expect(@robot.column).to eq 0
      expect(@robot.direction).to eq "WEST"
      expect(@robot.table.width).to eq 5
      expect(@robot.table.length).to eq 5
      expect(@robot.placed).to eq false
    end
  end

  describe ".place" do
    context "when place position is on the table" do
      let(:row) { 3 }
      let(:column) { 3 }
      let(:direction) { "NORTH" }
      let(:place) { @robot.place(row: row, column: column, direction: direction) }

      it "should update robot position with place position" do
        @robot.place(row: row, column: column, direction: direction)

        expect(@robot.row).to eq 3
        expect(@robot.placed).to eq true
      end
    end

    context "when place position is not on table" do
      # context - inherit everything from outside, can be redefined & overridden by let here
      it "should raise position error" do
        expect { @robot.place(row: 7, column: 5, direction: "WEST") }.to raise_error(PositionError)
      end
    end
  end

  describe ".report" do
    let(:direction) { "EAST" }
    let(:row) { @robot.row }
    let(:column) { @robot.column }
    let(:report) { @robot.report(row, column, direction) }

    it "displays the robot's current position" do
      expect(report).to eq "0, 0, EAST"
    end
  end
end
