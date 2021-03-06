class Job < ApplicationRecord
  validates :title, :level_of_interest, :city, presence: true
  belongs_to :company
  belongs_to :category
  has_many :comments

  def self.level_of_interest
    group(:level_of_interest).count
  end

  def self.count_of_jobs_in_city
    Job.all.pluck(:city)
  end


end
