class CreateWritings < ActiveRecord::Migration[7.1]
  def change
    create_table :writings do |t|
      t.string :title, null: false
      t.string :description, null: false
      t.string :url, null: false
      t.timestamps
    end
  end
end
