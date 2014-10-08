class AddFollowIdToActivities < ActiveRecord::Migration
  def change
    change_table :activities do |t|
      t.integer :follow_id
    end
  end
end
