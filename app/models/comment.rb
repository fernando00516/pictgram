class Comment < ApplicationRecord
  belongs_to :user_id
  belongs_to :topic_id
  validates :content, presence:true
end
