class Comment < ApplicationRecord
  belongs_to :status
  belongs_to :user
end
