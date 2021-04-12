require 'rails_helper'

RSpec.describe User, type: :model do
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
end
