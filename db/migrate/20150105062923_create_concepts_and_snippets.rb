class CreateConceptsAndSnippets < ActiveRecord::Migration
  def change
    create_table :concepts_and_snippets, id: false do |t|
      t.belongs_to :concept
      t.belongs_to :snippet
    end
  end
end
