class CreatePhotos < ActiveRecord::Migration
  def change
    create_table :photos do |t|
      t.string :title
      t.references :album, index: true
      t.timestamps
    end
    #add_index :photos, [:album_id, :created_at]
  end
end
