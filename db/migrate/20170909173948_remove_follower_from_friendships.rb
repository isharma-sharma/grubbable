class RemoveFollowerFromFriendships < ActiveRecord::Migration[5.0]
  def change
    remove_column :friendships, :follower, :integer
  end
end
