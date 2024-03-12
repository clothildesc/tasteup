class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :recipes, dependent: :destroy
  # has_many :favorites, dependent: :destroy
  # has_many :favorite_recipes, through: :favorites, source: :recipe

  acts_as_favoritor
  acts_as_favoritable

  # has_many :followers, foreign_key: :follower_id, class_name: "Follow", dependent: :destroy
  # has_many :followees, foreign_key: :followee_id, class_name: "Follow", dependent: :destroy

  # has_many :followed_users, through: :followers, source: :followee
  # has_many :following_users, through: :followees, source: :follower
end
