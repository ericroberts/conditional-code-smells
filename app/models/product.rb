class Product < ActiveRecord::Base
  has_many :pricings

  validates :name, presence: true

  def to_s
    name
  end
end
