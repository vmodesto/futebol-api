class CreateCurrentIssues < ActiveRecord::Migration[6.1]
  def change
    create_table :current_issues do |t|
      t.string :season
      t.string :name
      t.string :popular_name
      t.string :slug
      t.references :championship, null: false, foreign_key: true

      t.timestamps
    end
  end
end
