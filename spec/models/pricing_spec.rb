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

  describe '#price' do
    it 'should be a money' do
      expect(subject.price).to be_a Money
    end
  end

  describe '.to_data_points' do
    let(:pricing1) { create :pricing, price: 100 }
    let(:pricing2) { create :pricing, price: 200, dtstart: pricing1.dtstart, dtend: pricing1.dtstart + 1.month }

    before { pricing1; pricing2; }

    it 'should return an array of points' do
      expect(subject.class.to_data_points).to eq [
        point(pricing1.dtstart, pricing1.price),
        point(pricing1.dtend, pricing1.price),
        point(pricing2.dtstart, pricing2.price),
        point(pricing2.dtend, pricing2.price)
      ]
    end
  end

  describe '.data_point' do
    let(:date)  { Date.today }
    let(:price) { 100.to_money }
    let(:sut)   { subject.class.data_point(date, price) }

    it 'should return an object that responds to date' do
      expect(sut).to respond_to :date
    end

    it 'should return an object that responds to price' do
      expect(sut).to respond_to :price
    end
  end

  def point(date, price)
    OpenStruct.new(date: date, price: price)
  end
end
