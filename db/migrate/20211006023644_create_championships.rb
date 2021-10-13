class CreateChampionships < ActiveRecord::Migration[6.1]
  def change
    create_table :championships do |t|
      t.string :name
      t.string :slug
      t.string :popular_name
      t.string :status
      t.string :championship_type
      t.string :logo
      t.string :region

      t.timestamps
    end
  end
end
