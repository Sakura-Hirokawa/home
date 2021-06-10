class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  attachment :profile_image
  
  has_many :lists, dependent: :destroy
  has_many :list_comments, dependent: :destroy
  has_many :events, dependent: :destroy
  has_many :favorites, dependent: :destroy
  #与フォロー（フォローする）の関係性
  has_many :relationships, class_name: "Relationship", foreign_key: "follower_id", dependent: :destroy
  #与フォロー関係を通じて参照→自分 が フォローしている人
  has_many :followings, through: :relationships, source: :followed
  #被フォロー(フォローされる）の関係性
  has_many :reverse_of_relationships, class_name: "Relationship", foreign_key: "followed_id", dependent: :destroy
  #被フォロー関係を通じて参照→自分 を フォローしている人
  has_many :followers, through: :reverse_of_relationships, source: :follower
  
  def follow(user_id)
    relationships.create(followed_id: user_id)
  end
  
  def unfollow(user_id)
    relationships.find_by(followed_id: user_id).destroy
  end
  
  def following?(user)
    followings.include?(user)
  end
  
  #退会ユーザを弾く
  def active_for_authentication?
    super && (self.is_deleted == false)
  end
end