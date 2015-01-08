class Resource < ActiveRecord::Base
  belongs_to :taggable, polymorphic: true
  has_many :taggables_tags, as: :tag
  has_many :taggables, as: :tag, through: :taggables_tags
  has_and_belongs_to_many :concepts

  validates :author, presence: true
  validates :title, presence: true
  validates :url, presence: true
end
