class DashboardController < ApplicationController

  def index
    @job = Job.level_of_interest
  end

  def show

  end


end
