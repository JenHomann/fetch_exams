require 'rails_helper'

RSpec.describe Exam, type: :model do
  describe "associations" do
      it { should have_many :exam_users }
      it { should have_many :users }
      it { should belong_to :college }
  end

  describe "validations" do
    subject { build(:exam) }
    it { should validate_presence_of :start_time }
    it { should validate_presence_of :end_time }
    it { should validate_presence_of :college }
  end
end
