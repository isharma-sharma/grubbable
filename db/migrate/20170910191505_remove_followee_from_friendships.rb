class RemoveFolloweeFromFriendships < ActiveRecord::Migration[5.0]
  def change
    remove_column :friendships, :followee, :integer
  end
end
