class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, presence: true

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
