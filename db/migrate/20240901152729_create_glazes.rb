class CreateGlazes < ActiveRecord::Migration[7.1]
  def change
    create_enum :cone, ["04", "5", "6", "10"]
    create_enum :color, ["red", "orange", "yellow", "green", "blue", "purple", "pink", "brown", "black", "white", "gray", "gold", "silver"]

    create_table :glazes do |t|
      t.string :identifier, null: false
      t.string :name, null: false
      t.string :description, null: false
      t.boolean :food_safe, null: false
      t.enum :primary_color, enum_type: :color, null: false
      t.enum :minimum_cone, enum_type: :cone, null: false
      t.enum :maximum_cone, enum_type: :cone, null: false
      t.timestamps
    end
  end
end
