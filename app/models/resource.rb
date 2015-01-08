class Resource < ActiveRecord::Base
  has_and_belongs_to_many :posts
  has_and_belongs_to_many :blurbs
  has_and_belongs_to_many :concepts
end
