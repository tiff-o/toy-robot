require_relative 'spec_helper'
require_relative '../lib/position'

describe Position do
  subject { Position.new }

  describe '#initialize' do
    it 'should have max value of 5' do
      expect(subject.max).to eq 5
    end
  end

end
