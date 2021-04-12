class ExamUser < ApplicationRecord
  belongs_to :exam
  belongs_to :user

  validates :exam, :user, presence: true
  validates :user, uniqueness: { scope: :exam }
end
