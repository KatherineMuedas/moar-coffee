class ActivitiesController < ApplicationController
  def index
    # adds follow id to ids
    @ids = current_user.all_following.map(&:id)
    @activities = PublicActivity::Activity.order("created_at DESC").where(follow_id: @ids)
  end
end
