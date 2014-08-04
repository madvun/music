class CreateRecoveries < ActiveRecord::Migration
  def change
    create_table :recoveries do |t|

      t.timestamps
    end
  end
end
