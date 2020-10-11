require_relative 'spec_helper'
require_relative '../lib/table'

describe Table do
  before do
    @table = Table.new
    @robot = Robot.new(table: @table)
  end

  describe "#initialize" do
    it "should have width of 5" do
      expect(@table.width).to eq 5
    end
    it "should have height of 5" do
      expect(@table.length).to eq 5
    end
  end

  describe ".on_table?" do
    context "when position is on table" do
      let(:row) { 3 }
      let(:column) { 4 }

      let(:on_table) { @table.on_table?(row, column) }

      it "should return true" do
        expect(on_table).to eq true
      end
    end

    context "when position is not on table" do
      let(:row) { 7 }
      let(:column) { 4 }

      let(:on_table) { @table.on_table?(row, column) }

      it "should return false" do
        expect(on_table).to eq false
      end
    end
  end
end
