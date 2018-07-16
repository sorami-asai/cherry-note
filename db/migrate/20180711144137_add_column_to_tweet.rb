class AddColumnToTweet < ActiveRecord::Migration[5.1]
  def change
    add_column :tweets, :likes_count, :integer
  end
end
