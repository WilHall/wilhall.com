class CreateTerrariums < ActiveRecord::Migration[7.1]
  def change
    create_table :terrariums do |t|
      t.string :customer_name, null: false
      t.string :customer_email, null: false

      t.references :decoration, null: true, foreign_key: { to_table: :decorations }
      t.references :top_soil, null: true, foreign_key: { to_table: :soils }
      t.references :bottom_soil, null: true, foreign_key: { to_table: :soils }
      t.references :first_succulent, null: true, foreign_key: { to_table: :succulents }
      t.references :second_succulent, null: true, foreign_key: { to_table: :succulents }
      t.references :third_succulent, null: true, foreign_key: { to_table: :succulents }
      t.timestamps
    end
  end
end
