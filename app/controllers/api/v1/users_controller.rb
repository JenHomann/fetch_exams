class Api::V1::UsersController < ApplicationController
  before_action :verify_college
  before_action :verify_exam
  before_action :valid_exam?

  def verify
    if user.valid? && user.assign(exam)
      render status: :ok
    else
      render json: { error: "Unable to assign user to exam #{user_params[:exam_id]}. #{user.errors.full_messages.to_sentence}" }.to_json, status: :bad_request
    end
  end

  private

  def user_params
    params.permit(:first_name, :last_name, :phone_number, :college_id, :exam_id, :start_time)
  end

  def college
    @_college ||= College.find(user_params[:college_id])
  end

  def exam
    @_exam ||= college&.exams.find(user_params[:exam_id])
  end

  def start_time
    @_start_time ||= DateTime.parse(user_params[:start_time])
  rescue
    render json: { error: "Invalid start time for exam: #{user_params[:exam_id]}" }.to_json, status: :bad_request and return
  end

  def user
    User.where(first_name: user_params[:first_name], last_name: user_params[:last_name], phone_number: user_params[:phone_number]).first_or_create
  end

  def valid_exam?
    unless exam.valid_start?(start_time)
      render json: { error: "Invalid start time for exam: #{user_params[:exam_id]}" }.to_json, status: :bad_request
    end
  end

  def verify_college
    college.present?
  rescue ActiveRecord::RecordNotFound
    render json: { error: "Invalid college id: #{user_params[:college_id]}" }.to_json, status: :bad_request
  end

  def verify_exam
    exam.present?
  rescue ActiveRecord::RecordNotFound
    render json: { error: "Invalid exam id: #{user_params[:exam_id]} for college: #{user_params[:college_id]}" }.to_json, status: :bad_request
  end
end
