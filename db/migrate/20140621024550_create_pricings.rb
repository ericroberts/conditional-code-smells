class CreatePricings < ActiveRecord::Migration
  def change
    create_table :pricings do |t|
      t.money :price, null: false
      t.date :dtstart, null: false
      t.date :dtend, null: false
      t.integer :product_id, null: false

      t.timestamps
    end
  end
end
