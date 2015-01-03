class CreateConceptsAndResources < ActiveRecord::Migration
  def change
    create_table :concepts_and_resources, id: false do |t|
      t.belongs_to :concept
      t.belongs_to :resource
    end
  end
end
