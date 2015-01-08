class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title
      t.text :body
      t.boolean :published?
      t.string :published_at
      t.string :datetime

      t.timestamps
    end
  end
end
