class Friendship < ApplicationRecord
  belongs_to :user
  belongs_to :friend, :class_name => "User"
  validates :user_id, :friend_id, presence: true, uniqueness: true
  # belong_to  :status  :through :user

end
