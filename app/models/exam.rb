class Exam < ApplicationRecord
  belongs_to :college
  has_many :exam_users
  has_many :users, through: :exam_users

  validates :college, :start_time, :end_time, presence: true
end
