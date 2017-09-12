class AddFollowerFolloweeToFriendships < ActiveRecord::Migration[5.0]
  def change
    add_column :friendships, :follower, :integer
    add_column :friendships, :followee, :integer
  end
end
