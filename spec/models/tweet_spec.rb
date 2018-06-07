require 'rails_helper'

RSpec.describe Tweet, type: :model do
  let(:user) { FactoryBot.create(:user, email: 'new@test.com', handle: 'new user') }
  let(:tweet) { FactoryBot.create(:tweet) }

  describe 'attributes & validations' do
    it { should respond_to :body }
    it { should belong_to :user }
  end

  describe 'methods' do
    it 'should return tweets not belonging to user' do
      my_tweet = tweet
      tweet1 = user.tweets.create(body: 'Hello World')
      tweet2 = user.tweets.create(body: 'Goodbye Pluto')
      tweets = Tweet.not_user(my_tweet.user_id)
      expect(tweets).to eq([tweet2, tweet1])
    end
  end
end

