class CreateTaggablesTags < ActiveRecord::Migration
  def change
    create_table :taggables_tags do |t|
      t.integer :tag_id
      t.string :tag_type
      t.integer :taggable_id
      t.string :tag_type

      t.timestamps
    end
  end
end
