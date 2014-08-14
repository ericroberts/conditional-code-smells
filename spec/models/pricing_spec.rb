require 'rails_helper'

describe Pricing do
  subject { build :pricing }

  describe '#initialize' do
    it 'should not error' do
      expect { subject }.to_not raise_error
    end
  end

  describe '#valid?' do
    it 'should be valid' do
      expect(subject).to be_valid
    end
  end
end
