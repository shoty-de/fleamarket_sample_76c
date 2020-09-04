class CreateProfiles < ActiveRecord::Migration[5.2]
  def change
    create_table :profiles do |t|
      t.integer :user_id, foreign_key: true
      t.string :family_name, null: false
      t.string :family_name_kana, null: false
      t.string :first_name, null: false
      t.string :first_name_kana, null: false
      t.date   :birthday, null: false
    end
  end
end
