require_relative 'spec_helper'
require_relative '../lib/action'
require_relative '../lib/error/position_error'
require_relative '../lib/error/placed_error'

describe Action do
  describe "#initialize" do
    let(:table) { Table.new }
    let(:row) { 3 }
    let(:column) { 5 }
    let(:direction) { "NORTH" }
    let(:robot) { Robot.new(row: row, column: column, direction: direction, table: table) }
    let(:action) { Action.new(robot) }

    it "should initialize action with attributes from robot" do
      expect(action.robot.column).to eq 5
    end
  end

  describe ".move" do
    let(:table) { Table.new }
    let(:row) { 3 }
    let(:column) { 5 }
    let(:direction) { "WEST" }
    let(:robot) { Robot.new(row: row, column: column, direction: direction, table: table, placed: true) }
    let(:action) { Action.new(robot) }

    it "should raise placed error if robot hasn't been placed yet" do
      @robot = Robot.new(direction: direction, table: table, placed: false)
      @action = Action.new(@robot)

      expect { @action.move }.to raise_error(PlacedError)
    end

    context "when new position is on the table" do
      let(:move) { action.move }

      it "should move robot one position further WEST (left)" do
        expect(move).to eq 4
        expect(robot.direction).to eq "WEST"
      end
    end

    context "when new position is not on table" do
      # it "should raise position error" do
      #   @robot = Robot.new(row: 0, column: 0, direction: direction, table: table, placed: true)
      #   @action = Action.new(@robot)

      #   expect { @action.move }.to raise_error(PositionError)
      # end

      it "rescue position error and prompt user to try again" do
        @robot = Robot.new(row: 0, column: 0, direction: direction, table: table, placed: true)
        @action = Action.new(@robot)
        expect(@action.move).to eq "Try again, position not on table."
      end
    end
  end
end
