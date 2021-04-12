class User < ApplicationRecord
  has_many :exam_users
  has_many :exams, through: :exam_users

  validates :first_name, :last_name, :phone_number, presence: true
  validates :last_name, uniqueness: { scope: [:first_name, :phone_number] }
end
