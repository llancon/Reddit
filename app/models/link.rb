class Link < ApplicationRecord
  has_many :votes
  belongs_to :user, optional: true
  has_many :taggings
  has_many :tags, through: :taggings

  def tag_names
    tags.collect(&:name).join(", ")

  end

end
