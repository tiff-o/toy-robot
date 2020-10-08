require_relative 'spec_helper'
require_relative '../lib/robot'

describe Robot do
  subject { Robot.new(@row, @column, @direction) }

  describe "#initialize" do
    let(:row) { 1 }
    let(:column) { 2 }
    let(:direction) { "NORTH" }
    let(:robot) { Robot.new(row, column, direction) }

    it "initializes robot with place position" do
      expect(robot.row).to eq 1
      expect(robot.column).to eq 2
      expect(robot.direction).to eq "NORTH"
    end
  end

  # describe ".on_table?" do
  #   let(:row) { 1 }
  #   let(:column) { 2 }
  #   let(:direction) { "NORTH" }
  #   let(:robot) { Robot.new(row, column, direction) }

  #   it "should return true if position chosen is on table" do
  #     expect(subject.on_table?(row, column)).to eq true
  #   end
  # end

  # describe ".on_table?" do
  #   let(:row) { 5 }
  #   let(:column) { 7 }
  #   let(:direction) { "NORTH" }
  #   let(:robot) { Robot.new(row, column, direction) }

  #   it "should return false if position chosen is not on table" do
  #     expect(subject.on_table?(row, column)).to eq false
  #   end
  # end

  describe ".place" do
    let(:row) { 3 }
    let(:column) { 3 }
    let(:direction) { "WEST" }
    let(:robot) { Robot.new(1, 1, "NORTH") }
    let(:place) { robot.place(row, column, direction) }

    it "puts robot in place position & direction" do
      expect(place).to eq "3, 3, WEST"
    end
  end

    describe ".place" do
    let(:row) { 7 }
    let(:column) { 3 }
    let(:direction) { "WEST" }
    let(:robot) { Robot.new(1, 1, "NORTH") }
    let(:place) { robot.place(row, column, direction) }

    it "not place robot if not on table" do
      expect(place).to eq "position not on table"
    end
  end

  describe ".report" do
    let(:row) { 4 }
    let(:column) { 1 }
    let(:direction) { "EAST" }
    let(:robot) { Robot.new(row, column, direction) }
    let(:report) { robot.report(row, column, direction) }

    it "displays the robot's current position" do
      expect(report).to eq "4, 1, EAST"
    end
  end


end
