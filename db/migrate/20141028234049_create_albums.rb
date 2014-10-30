class CreateAlbums < ActiveRecord::Migration
  def change
    create_table :albums do |t|
      t.string :title
      t.references :user, index: true
      t.timestamps
    end
    add_index :albums, [:user_id, :created_at]
  end
end
