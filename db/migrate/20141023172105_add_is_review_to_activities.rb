class AddIsReviewToActivities < ActiveRecord::Migration
  def change
    add_column :activities, :is_checkin, :boolean, default: false
  end
end
