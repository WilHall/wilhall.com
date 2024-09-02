class CreateSucculents < ActiveRecord::Migration[7.1]
  def change
    create_table :succulents do |t|
      t.string :name, null: false
      t.string :description, null: false
      t.timestamps
    end
  end
end
