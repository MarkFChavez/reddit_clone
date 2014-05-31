class CreateReddits < ActiveRecord::Migration
  def change
    create_table :reddits do |t|
      t.integer :user_id
      t.string :title
      t.integer :resource_id
      t.string :resource_type

      t.timestamps
    end
    add_index :reddits, :user_id
    add_index :reddits, [:resource_id, :resource_type]
  end
end
