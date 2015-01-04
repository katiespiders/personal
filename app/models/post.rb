class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, presence: true

  def timestamp
    format = '%-d %B %Y'
    published? ? published_at.strftime(format) : updated_at.strftime(format)
  end
end
