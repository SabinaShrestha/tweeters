class User < ApplicationRecord
  EGG = 'https://cdn.pixabay.com/photo/2013/07/13/10/26/egg-157224_960_720.png'.freeze

  after_create :make_egg
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

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
