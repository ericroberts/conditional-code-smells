class Product < ActiveRecord::Base
  has_many :pricings

  validates :name, presence: true
end
