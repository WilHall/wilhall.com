class CreatePhotos < ActiveRecord::Migration[7.1]
  def change
    create_enum :photo_category, ["portrait", "landscape", "other"]

    create_table :photos do |t|
        t.enum :category, enum_type: :photo_category, null: false
        t.timestamps
    end
  end
end
