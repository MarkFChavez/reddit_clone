class RemoveTitleOnReddits < ActiveRecord::Migration
  def change
    remove_column :reddits, :title
  end
end
