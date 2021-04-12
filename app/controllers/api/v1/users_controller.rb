class Api::V1::UsersController < ApplicationController
  def verify
    if valid_exam? && user.assign(exam)
      render status: :ok
    else
      render status: :bad_request
    end
  end

  private

  def user_params
    params.permit(:first_name, :last_name, :phone_number, :college_id, :exam_id, :start_time)
  end

  def college
    @_college ||= College.find(user_params[:college_id]) rescue nil
  end

  def exam
    @_exam ||= college&.exams.find(user_params[:exam_id]) rescue nil
  end

  def start_time
    @_start_time ||= DateTime.parse(user_params[:start_time]) rescue nil
  end

  def user
    User.where(first_name: user_params[:first_name], last_name: user_params[:last_name], phone_number: user_params[:phone_number]).first_or_create
  end

  def valid_exam?
    return false if college.nil? || exam.nil? || start_time.nil?
    exam.valid_start?(start_time)
  end
end
