require 'rails_helper'

RSpec.describe Comment, type: :model do
  describe "validations" do
    it { should validate_presence_of(:content) }
    it { should validate_presence_of(:user) }
    it { should validate_presence_of(:task) }
  end

  describe "associations" do
    it { should belong_to(:user) }
    it { should belong_to(:task) }
  end
end
