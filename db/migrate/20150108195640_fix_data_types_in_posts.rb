class FixDataTypesInPosts < ActiveRecord::Migration
  def change
    remove_column :posts, :datetime
    remove_column :posts, :published_at
    add_column :posts, :published_at, :datetime
  end
end
