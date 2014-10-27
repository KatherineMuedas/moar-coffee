class StatsController < ApplicationController
  def index
    @has_many = LocStats.get_has_many_relationships
    @loc = LocStats.get_lines_of_code
    @loc_by_file = LocStats.sort_by_lines_of_code
  end
end
