class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, presence: true

  def self.sort
    all.to_a.sort_by{ |post| post.sort_timestamp }.reverse
  end

  def sort_timestamp
    published? ? published_at : updated_at
  end
end
