class Like < ApplicationRecord
  belongs_to :tweet, counter_cache: :likes_count
  belongs_to :user
  validates :user_id, presence: true
  validates :tweet_id, presence: true
end
