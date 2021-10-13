class CreateCurrentPhases < ActiveRecord::Migration[6.1]
  def change
    create_table :current_phases do |t|
      t.string :name
      t.string :slug
      t.string :phase_type
      t.references :championship, null: false, foreign_key: true

      t.timestamps
    end
  end
end
