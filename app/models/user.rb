# frozen_string_literal: true
 class User < ApplicationRecord
  include Authentication
  has_many :examples
  has_many :statuses
  # has_many :statuses, through: :friendships, :source => :user
  has_many :comments, through: :statuses
  has_many :friendships
  has_many :friends, through: :friendships
  has_many :inverse_friends, through: :inverse_friendships, source: :user

  def to_param
      name
    end

end
