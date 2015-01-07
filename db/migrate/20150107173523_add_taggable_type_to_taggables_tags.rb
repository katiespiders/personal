class AddTaggableTypeToTaggablesTags < ActiveRecord::Migration
  def change
    add_column :taggables_tags, :taggable_type, :string
  end
end
