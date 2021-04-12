class Exam < ApplicationRecord
  belongs_to :college
  has_many :exam_users
  has_many :users, through: :exam_users

  validates :college, :start_time, :end_time, presence: true

  # Public: Returns whether the given start time is between the start and end time of this exam
  #
  #   start - (DateTime) the time to check against the exam's start and end time
  #
  # Returns a Boolean
  def valid_start?(start)
    return false if start.nil?
    start_time <= start && end_time >= start
    # (start_time..end_time).cover?(start)
  end
end
