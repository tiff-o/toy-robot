require_relative 'spec_helper'
require_relative '../lib/place'

describe Place do
  subject { Place.new }
  describe '#initialize' do
    it 'should initialize at origin 0' do
      expect(subject.origin).to eq 0
    end

  end

end
