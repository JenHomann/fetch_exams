require 'rails_helper'

RSpec.describe "Users", type: :request do
  let(:user) { create(:user) }
  let(:exam) { create(:exam, college: college) }
  let(:college) { create(:college) }

  let(:valid_params) { { first_name: user.first_name, last_name: user.last_name, phone_number: user.phone_number, college_id: college.id, exam_id: exam.id, start_time: exam.start_time + 1.day } }

  describe "post verify" do
    context "with valid params" do
      subject { post "/api/v1/verify", params: valid_params }

      it "returns success" do
        subject
        expect(response).to have_http_status(200)
      end
    end

    context "with invalid params" do
      subject { post "/api/v1/verify", params: invalid_params }

      context "with an invalid college id" do
        let(:invalid_params) { { first_name: user.first_name, last_name: user.last_name, phone_number: user.phone_number, college_id: college.id + 10, exam_id: exam.id, start_time: exam.start_time + 1.day } }

        it "returns a bad request" do
          subject
          expect(response).to have_http_status(400)
        end
      end

      context "with an invalid exam id" do
        let(:invalid_params) { { first_name: user.first_name, last_name: user.last_name, phone_number: user.phone_number, college_id: college.id, exam_id: exam.id + 10, start_time: exam.start_time + 1.day } }
        it "returns a bad request" do
          subject
          expect(response).to have_http_status(400)
        end
      end

      context "with an invalid start time" do
        let(:invalid_params) { { first_name: user.first_name, last_name: user.last_name, phone_number: user.phone_number, college_id: college.id, exam_id: exam.id, start_time: exam.start_time - 1.day } }
        it "returns a bad request" do
          subject
          expect(response).to have_http_status(400)
        end
      end
    end
  end
end
