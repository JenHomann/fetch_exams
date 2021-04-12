require 'rails_helper'

RSpec.describe Exam, type: :model do
  let!(:exam) { build_stubbed(:exam) }

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

  describe "#valid_start?" do
    it "return false with a nil start" do
      start = nil
      expect(exam.valid_start?(start)).to be false
    end

    it "returns false with a start before the exam's start time" do
      start = exam.start_time - 1.hour
      expect(exam.valid_start?(start)).to be false
    end

    it "returns false with a start time after the exam's end time" do
      start = exam.end_time + 1.hour
      expect(exam.valid_start?(start)).to be false
    end

    it "returns true with a start between the exam's start and end times" do
      start = exam.start_time + 1.hour
      expect(exam.valid_start?(start)).to be true
    end

    it "returns true with a start that is equal to the exam's start time" do
      start = exam.start_time
      expect(exam.valid_start?(start)).to be true
    end

    it "returns false with a start that is equal to the exam's end time" do
      start = exam.end_time
      expect(exam.valid_start?(start)).to be true
    end
  end
end
