class CreateClays < ActiveRecord::Migration[7.1]
  def change
    create_table :clays do |t|
      t.string :identifier, null: false
      t.string :name, null: false
      t.string :url, null: false
      t.float :shrinkage, null: false
      t.float :absorption, null: false
      t.string :description, null: false
      t.timestamps
    end
  end
end
