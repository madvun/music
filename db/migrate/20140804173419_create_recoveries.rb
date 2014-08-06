class CreateRecoveries < ActiveRecord::Migration
  def change
    create_table :recoveries do |t|
      t.integer   :user_id
      t.string    :key
      t.timestamps
    end
  end
end
