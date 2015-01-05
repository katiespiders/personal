class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, presence: true

  def self.sort
    all.to_a.sort_by{ |post| post.timestamp }.reverse
  end

  def timestamp
    published? ? published_at : updated_at
  end
end
