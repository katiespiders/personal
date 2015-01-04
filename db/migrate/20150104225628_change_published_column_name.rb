class ChangePublishedColumnName < ActiveRecord::Migration
  def change
    rename_column :posts, :published, :published?
  end
end
