require 'rails_helper'

describe Product do
  subject { build :product }

  describe '#initialize' do
    it 'should not error' do
      expect { subject }.to_not raise_error
    end
  end

  describe '#valid?' do
    it 'should be valid' do
      expect(subject).to be_valid
    end

    context 'without a name' do
      before { subject.name = nil }

      it 'should not be valid' do
        expect(subject).to_not be_valid
      end
    end
  end

  describe '#to_s' do
    it 'should return name' do
      expect(subject.to_s).to eq subject.name
    end
  end
end
