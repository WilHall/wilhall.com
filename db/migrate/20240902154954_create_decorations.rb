class CreateDecorations < ActiveRecord::Migration[7.1]
  def change
    create_table :decorations do |t|
      t.string :name, null: false
      t.string :description, null: false
      t.timestamps
    end
  end
end
