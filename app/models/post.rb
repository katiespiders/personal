class Post < ActiveRecord::Base
  has_and_belongs_to_many :resources
  has_and_belongs_to_many :concepts

  validates :title, presence: true
  validates :body, presence: true

  def self.sort_asc(subset)
    subset.to_a.sort_by{ |post| post.timestamp }
  end

  def self.sort_desc(subset)
    sort_asc(subset).reverse
  end

  def timestamp
    published? ? published_at : updated_at
  end
end
