class StatusSerializer < ActiveModel::Serializer
  attributes :id, :status, :date
  has_one :user
end
