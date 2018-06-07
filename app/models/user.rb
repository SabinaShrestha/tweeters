class User < ApplicationRecord
  EGG = '/assets/egg.png'
  after_create :make_egg
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :tweets
  has_many :comments
  validates :handle, presence: true
  validates :handle, uniqueness: true
  serialize :followers, Array
  serialize :following, Array

  def make_egg
    if self.avatar.blank?
      self.avatar = EGG
      self.save
    end
  end
end
