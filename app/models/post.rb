class Post < ActiveRecord::Base
  belongs_to :tags, polymorphic: true
  has_many :taggables_tags, as: :taggable
  has_many :tags, as: :taggable, through: :taggables_tags

  validates :title, presence: true
  validates :body, presence: true

  def self.sort_asc
    all.to_a.sort_by{ |post| post.timestamp }
  end

  def self.sort_desc
    sort_asc.reverse
  end

  def timestamp
    published? ? published_at : updated_at
  end
end
