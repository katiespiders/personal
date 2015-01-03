class CreateResources < ActiveRecord::Migration
  def change
    create_table :resources do |t|
      t.string :title
      t.string :author
      t.string :url
      t.datetime :retrieved_at

      t.timestamps
    end
  end
end
