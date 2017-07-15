class DashboardController < ApplicationController

  def index
    @job = Job.level_of_interest
    @company = Company.top_three_companies_by_interest
    @jobs = Job.count_of_jobs_in_city
  end

  def show

  end


end
