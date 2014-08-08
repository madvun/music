class CreateSongs < ActiveRecord::Migration
  def change
    create_table :songs do |t|
      t.string :file
      t.string :name
      t.integer :user_id
      t.timestamps
    end
  end
end
