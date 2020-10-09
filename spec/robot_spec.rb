require_relative 'spec_helper'
require_relative '../lib/robot'

describe Robot do
  before do
    table = Table.new
    @robot = Robot.new(direction: "WEST", table: table)
  end

  describe "#initialize" do
    it "initializes robot with default position" do
      expect(@robot.row).to eq 0
      expect(@robot.column).to eq 0
      expect(@robot.direction).to eq "WEST"
      expect(@robot.table.width).to eq 5
      expect(@robot.table.length).to eq 5
    end
  end

  describe ".place" do
    context "when robot place position is on the table" do
      let(:row) { 3 }
      let(:column) { 3 }
      let(:direction) { "NORTH" }
      let(:place) { @robot.place(row: row, column: column, direction: direction) }

      it "puts robot in place position & direction" do
        @robot.place(row: row, column: column, direction: direction)

        expect(@robot.row).to eq 3
      end
    end

    context "when robot off table" do
      # context - inherit everything from outside, can be redefined & overridden by let here
      it "raises an error" do
        expect { @robot.place }.to raise_error
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
