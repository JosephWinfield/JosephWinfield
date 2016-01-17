class CreatePhotos < ActiveRecord::Migration
  def change
    create_table :photos do |t|
      t.string :url, null: false
      t.text :description

      t.timestamps null: false
    end
  end
end
