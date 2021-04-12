require 'rails_helper'

RSpec.describe College, type: :model do
  describe "associations" do
    it { should have_many :exams }
  end
end
