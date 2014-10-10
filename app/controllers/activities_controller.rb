class ActivitiesController < ApplicationController
  def index
    @ids = current_user.all_following.map(&:id)
    @ids << current_user.id
    @activities = PublicActivity::Activity.order("created_at DESC").where(follow_id: @ids)
  end
end
