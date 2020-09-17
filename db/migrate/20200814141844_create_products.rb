class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products, id: :integer do |t|
      t.string  :title,               null: false
      t.string  :text,                null: false
      t.integer  :condition_id,       foreign_key: true
      t.string  :brand
      t.integer :shipping_charge_id,  foreign_key: true
      t.integer :deliver_leadtime_id, foreign_key: true
      t.integer :price,               null: false
      t.integer :seller_id,           foreign_key: true
      t.integer :buyer_id,            foreign_key: true
      t.integer :category_id,         foreign_key: true
      # t.integer :size_id,          foreign_key: true
      t.integer :prefecture_id,       foreign_key: true
      t.timestamps
    end
  end
end
