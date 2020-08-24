class CreateAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :addresses do |t|
      t.integer  :user_id,                 foreign_key: true
      t.string   :post_family_name,        null: false
      t.string   :post_family_name_kana,   null: false
      t.string   :post_first_name,         null: false
      t.string   :post_first_name_kana,    null: false
      t.string   :postal_code,             null: false
      t.integer  :prefecture_id,           null: false
      t.string   :city,                    null: false
      t.string   :address,                 null: false
      t.string   :building
      t.string   :phone_number
      t.timestamps null: false
    end
  end
end
