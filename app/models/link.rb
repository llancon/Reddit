class Link < ApplicationRecord
  has_many :votes
  belongs_to :user, optional: true
end
