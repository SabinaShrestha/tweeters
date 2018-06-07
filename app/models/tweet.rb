class Tweet < ApplicationRecord
  belongs_to :user
  has_many :comments

  def format_likes
    self.likes.blank? ? 0 : self.likes
  end

  def self.with_user_info(id)
    select('tweets.id, body, u.avatar, u.handle')
    .joins('INNER JOIN users u ON u.id = tweets.user_id')
    .where('tweets.id = ?', id)
    .limit(1)
    .first
  end

  def self.not_user(id)
    select('tweets.id, likes, body, u.handle, u.avatar')
    .joins('INNER JOIN users u ON u.id = tweets.user_id')
    .where
    .not(user_id: id)
    .order(created_at: :desc)
  end
end
