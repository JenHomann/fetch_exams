require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { create(:user) }
  let(:exam) { create(:exam) }

  describe "associations" do
    it { should have_many :exam_users }
    it { should have_many :exams }
  end

  describe "validations" do
    subject { build(:user) }
    it { should validate_presence_of :first_name }
    it { should validate_presence_of :last_name }
    it { should validate_presence_of :phone_number }
    it { should validate_uniqueness_of(:last_name).scoped_to(:first_name, :phone_number) }
  end

  describe "#assign" do
    context "when the given exam already exists for the user" do
      let!(:exam_user) { create(:exam_user, exam: exam, user: user) }

      it "returns the existing exam" do
        expect(user.assign(exam)).to eq exam_user
      end

      it "does not create a new exam user" do
        expect { user.assign(exam) }.not_to change(ExamUser, :count)
      end
    end

    context "when a given exam does not exist for the user" do
      it "creates a new exam" do
        expect { user.assign(exam) }.to change(ExamUser, :count).by(1)
      end
    end
  end
end
