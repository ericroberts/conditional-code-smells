class Pricing < ActiveRecord::Base
  belongs_to :product

  validates :product, :price, :dtstart, :dtend, presence: true

  monetize :price_cents

  def self.to_data_points
    all.map do |pricing|
      [
        data_point(pricing.dtstart, pricing.price),
        data_point(pricing.dtend, pricing.price)
      ]
    end.flatten
  end

  def self.data_point(date, price)
    OpenStruct.new(date: date, price: price)
  end
end
