3.times do |i|
  handle = "user-#{SecureRandom.hex}"
  email = "user#{SecureRandom.hex}@test.com"
  password = "password"
  u = User.create(email: email, handle: handle, password: password)
  10.times do |j|
    body = Faker::Lorem.sentence(2, false, 4)
    likes = Faker::Number.between(0, 300)
    tweet = Tweet.create(user_id: u.id, body: body, likes: likes)
    2.times do
      body = Faker::Hipster.paragraph
      Comment.create(body: body, tweet_id: tweet.id, user_id: u.id)
    end
  end
end
