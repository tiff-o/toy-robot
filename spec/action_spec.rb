require_relative 'spec_helper'
require_relative '../lib/action'

describe Action do
  before do
    table = Table.new
    @robot = Robot.new(table: table)
  end

  context "when robot has been placed" do
    before do
      @robot.place(row: 2, column: 4, direction: "WEST")
    end

    describe "#self.turn_left" do
      it "should turn robot LEFT without changing row & column position" do
        Action.turn_left(@robot)

        expect(@robot.row).to eq 2
        expect(@robot.column).to eq 4
        expect(@robot.direction).to eq "SOUTH"
      end
    end

    describe "#self.turn_right" do
      it "should turn robot RIGHT without changing row & column position" do
        Action.turn_right(@robot)

        expect(@robot.row).to eq 2
        expect(@robot.column).to eq 4
        expect(@robot.direction).to eq "NORTH"
      end
    end

    describe "#self.report" do
      it "should display the robot's current position" do
        expect(Action.report(@robot)).to eq "2, 4, WEST"
      end
    end
  end

  context "when robot hasn't been placed" do
    describe "#self.turn_left" do
      it "should raise placed error" do
        expect { Action.turn_left(@robot) }.to raise_error(Robot::PlacedError)
      end
    end

    describe "#self.turn_right" do
      it "should raise placed error" do
        expect { Action.turn_right(@robot) }.to raise_error(Robot::PlacedError)
      end
    end

    describe "#self.move" do
      it "should raise placed error" do
        expect { Action.move(@robot) }.to raise_error(Robot::PlacedError)
      end
    end

    describe "#self.report" do
      it "should raise placed error" do
        expect { Action.report(@robot) }.to raise_error(Robot::PlacedError)
      end
    end
  end

  context "when robot has been placed & new position is on the table" do
    describe "#self.move" do
      it "should move robot one position forward in facing direction (WEST)" do
        @robot.place(row: 2, column: 4, direction: "WEST")
        Action.move(@robot)

        expect(@robot.row).to eq 2
        expect(@robot.column).to eq 3
        expect(@robot.direction).to eq "WEST"
      end
    end
  end

  context "when robot has been placed & new position is not on the table" do
    describe "#self.move" do
      it "should raise position error" do
        @robot.place(row: 2, column: 0, direction: "WEST")

        expect { Action.move(@robot) }.to raise_error(Robot::PositionError)
      end
    end
  end
end

# it "rescue position error and prompt user to try again" do
#   @robot = Robot.new(row: 0, column: 0, direction: direction, table: table, placed: true)
#   @action = Action.new(@robot)
#   expect(@action.move).to eq "Try again, position not on table."
# end
