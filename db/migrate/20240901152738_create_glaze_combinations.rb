class CreateGlazeCombinations < ActiveRecord::Migration[7.1]
  def change
    create_table :glaze_combinations do |t|
      t.string :name, null: false
      t.string :description, null: false
      t.enum :primary_color, enum_type: :color, null: false
      t.references :first_glaze, null: false, foreign_key: { to_table: :glazes }
      t.references :second_glaze, null: false, foreign_key: { to_table: :glazes }
      t.timestamps
    end
  end
end
