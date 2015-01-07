class CreateConceptsResources < ActiveRecord::Migration
  def change
    create_table :concepts_resources, id: false do |t|
      t.integer :resource_id
      t.integer :concept_id
    end
  end
end
