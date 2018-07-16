class AddColumnToTweets < ActiveRecord::Migration[5.1]
  def change
    add_column :tweets, :comments_count, :integer
  end
end
