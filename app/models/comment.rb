class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :tweet, counter_cache: :comments_count
end
