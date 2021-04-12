require 'rails_helper'

RSpec.describe ExamUser, type: :model do
  describe "associations" do
    it { should belong_to :exam }
    it { should belong_to :user }
  end

  describe "validations" do
    subject { build(:exam_user) }
    it { should validate_presence_of :exam }
    it { should validate_presence_of :user }
  end
end
