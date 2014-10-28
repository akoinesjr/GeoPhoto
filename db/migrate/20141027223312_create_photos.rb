class CreatePhotos < ActiveRecord::Migration
  def change
    create_table :photos do |t|
      t.string :title
      t.references :user, index: true
      t.timestamps
    end
    add_index :photos, [:user_id, :created_at]
  end
end
