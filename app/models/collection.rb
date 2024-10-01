class Collection < ApplicationRecord
  validates :name, :released_at, presence: true
end
