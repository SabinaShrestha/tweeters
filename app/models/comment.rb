class Comment < ApplicationRecord
  belongs_to :tweet
  belongs_to :user

  def self.with_user_info(tweet_id)
    select('comments.id, comments.body, u.handle')
    .joins('INNER JOIN tweets t ON t.id = comments.tweet_id
            INNER JOIN users u ON u.id = comments.user_id')
    .where('t.id = ?', tweet_id)
  end
end
