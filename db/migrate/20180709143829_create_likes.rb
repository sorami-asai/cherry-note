class CreateLikes < ActiveRecord::Migration[5.1]
  def change
    create_table :likes do |t|
      t.integer :tweet_id, foreign_key: true
      t.integer :user_id, foreign_key: true

      t.timestamps

      t.index :tweet_id
      t.index :user_id
      t.index [:user_id, :tweet_id], unique: true
    end
  end
end
