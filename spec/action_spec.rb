require_relative 'spec_helper'
require_relative '../lib/action'

describe Action do
  describe ".move" do
    let(:row) { 3 }
    let(:column) { 3 }
    let(:direction) { "WEST" }
    let(:action) { Action.new(row, column, direction) }
    let(:move) { action.move(row, column, direction) }

    it "moves robot one position further WEST (left)" do
      expect(move).to eq "3, 2, WEST"
    end
  end
  describe ".move" do
    let(:row) { 2 }
    let(:column) { 2 }
    let(:direction) { "NORTH" }
    let(:action) { Action.new(row, column, direction) }
    let(:move) { action.move(row, column, direction) }

    it "moves robot one position further NORTH (up)" do
      expect(move).to eq "3, 2, NORTH"
    end
  end
end
