require 'rails_helper'

RSpec.describe User, type: :model do
  describe "attributes & validations" do
    it { should respond_to :handle }
    it { should respond_to :avatar }
    it { should have_many :tweets }
    it { should validate_presence_of :handle }
    it { should validate_uniqueness_of :handle }
  end

  describe "methods" do
    it "should provide default avatar" do
      user = FactoryBot.create(:user)
      expect(user.avatar).to eq(User::EGG)
    end
  end
end



