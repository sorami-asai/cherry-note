class ChangeColumnToComment < ActiveRecord::Migration[5.1]
  def change
    rename_column :comments, :text, :comments
  end
end
