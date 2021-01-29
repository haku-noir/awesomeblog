class User < ApplicationRecord
  validates :name, presence: true, length: { maximum: 50 }
  validates :email, presence: true, length: { maximum: 255 }, uniqueness: { case_sensitive: false }
  validates :password, allow_nil: true, length: { minimum: 6 }
  has_secure_password
  has_many :microposts, dependent: :destroy

  def follow(other_user)
    Relationship.create(
      follower_id: id,
      followed_id: other_user.id
    )
  end

  def unfollow(other_user)
    relationship = Relationship.find_by(
      follower_id: id,
      followed_id: other_user.id
    )

    if relationship
      relationship.destroy
    end
  end

  def is_follower?(other_user)
    relationship = Relationship.find_by(
      follower_id: id,
      followed_id: other_user.id
    )

    return !relationship.nil?
  end
end
