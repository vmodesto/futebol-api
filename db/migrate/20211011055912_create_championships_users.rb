class CreateChampionshipsUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :championships_users do |t|
      t.references :user, null: false, foreign_key: true
      t.references :championship, null: false, foreign_key: true

      t.timestamps
    end
    add_index :championships_users, [:user_id, :championship_id], unique: true
    add_index :championships_users, [:championship_id, :user_id], unique: true
  end
end
