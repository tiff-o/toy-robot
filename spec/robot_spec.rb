require_relative 'spec_helper'
require_relative '../lib/robot'

describe Robot do
  before do
    @table = Table.new
    @robot = Robot.new(table: @table)
  end

  describe "#initialize" do
    it "should create robot with nil position" do
      expect(@robot.row).to eq nil
      expect(@robot.column).to eq nil
      expect(@robot.direction).to eq nil
      expect(@table.width).to eq 5
      expect(@table.length).to eq 5
    end
  end

  describe ".place" do
    context "when place position is on the table" do
      let(:row) { 3 }
      let(:column) { 3 }
      let(:direction) { "NORTH" }

      it "should update robot position with place position" do
        @robot.place(row: row, column: column, direction: direction)

        expect(@robot.row).to eq 3
        expect(@robot.column).to eq 3
        expect(@robot.direction).to eq "NORTH"
      end
    end

    context "when place position is not on table" do
      # context - inherit everything from outside, can be redefined & overridden by let here
      it "should raise position error" do
        expect { @robot.place(row: 7, column: 5, direction: "WEST") }.to raise_error(Robot::PositionError)
      end
    end
  end

  describe ".can_move" do
    context "when robot has been placed" do
      it "should move robot to new position" do
        @robot.place(row: 3, column: 2, direction: "NORTH")
        @robot.can_move(row: 5, column: 4, direction: "WEST")

        expect(@robot.row).to eq 5
        expect(@robot.column).to eq 4
        expect(@robot.direction).to eq "WEST"
      end
    end
    context "when robot has not been placed yet" do
      it "should raise placed error if robot hasn't been placed" do
        expect { @robot.can_move(row: 5, column: 4, direction: "WEST") }.to raise_error(Robot::PlacedError)
      end
    end
  end
end
