class Vote < ApplicationRecord
  belongs_to :link, optional: true
  belongs_to :user, optional: true
end
