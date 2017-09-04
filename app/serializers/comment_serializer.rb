class CommentSerializer < ActiveModel::Serializer
  attributes :id, :comment, :date
  has_one :status
  has_one :user
end
