json.array! @product.pricings.to_data_points do |pricing|
  json.date pricing.date
  json.price pricing.price.to_f
end
