require_relative 'spec_helper'
require_relative '../lib/table'

describe Table do
  describe "#initialize" do
    let(:table) { Table.new }

    it "should have width of 5" do
      expect(table.width).to eq 5
    end
    it "should have height of 5" do
      expect(table.length).to eq 5
    end

  end
end
