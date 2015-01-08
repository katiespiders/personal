class JoinTables < ActiveRecord::Migration
  def change
    create_table :concepts_resources, id: false do |t|
      t.integer :concept_id
      t.integer :resource_id
    end

    create_table :concepts_posts, id: false do |t|
      t.integer :concept_id
      t.integer :post_id
    end

    create_table :posts_resources, id: false do |t|
      t.integer :post_id
      t.integer :resource_id
    end

    create_table :blurbs_concepts, id: false do |t|
      t.integer :blurb_id
      t.integer :concept_id
    end

    create_table :blurbs_resources, id: false do |t|
      t.integer :blurb_id
      t.integer :resource_id
    end

  end
end
