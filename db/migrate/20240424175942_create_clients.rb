class CreateClients < ActiveRecord::Migration[7.1]
  def change
    create_table :clients do |t|
      t.string :name, null: false
      t.text :api_key, null: false
      t.boolean :active, null: false

      t.timestamps
    end

    add_index :clients, :name, unique: true
    add_index :clients, :api_key, unique: true
  end
end
