class CreateProfiles < ActiveRecord::Migration[5.2]
  def change
    create_table :profiles do |t|
      t.integer :user_id, foreign_key: true
      t.string :family_name, null: false
      t.string :family_name_kana, null: false
      t.string :first_name, null: false
      t.string :first_name_kana, null: false
      t.integer :birthday, null: false
      t.integer :birthmonth, null: false
      t.integer :birthyear, null: false
    end
  end
end