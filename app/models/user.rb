class User < ApplicationRecord
  has_many :exam_users
  has_many :exams, through: :exam_users

  validates :first_name, :last_name, :phone_number, presence: true
  validates :last_name, uniqueness: { scope: [:first_name, :phone_number] }

  # Public: Assigns an exam to the user or retrieves the existing assignment
  #
  #   exam - (Exam) the exam to assign to the user
  #
  # Returns an ExamUser
  def assign(exam)
    exam_users.where(exam: exam).first_or_create
  end
end
