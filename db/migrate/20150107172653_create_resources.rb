class CreateResources < ActiveRecord::Migration
  def change
    create_table :resources do |t|
      t.string :author
      t.string :title
      t.string :url

      t.timestamps
    end
  end
end
