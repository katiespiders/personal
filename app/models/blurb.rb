class Blurb < ActiveRecord::Base
  belongs_to :tag, polymorphic: true
  has_many :taggables_tags, as: :taggable
  has_many :tags, as: :taggable, through: :taggables_tags

  validates :body, presence: true
end
