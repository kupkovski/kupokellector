class Collection < ApplicationRecord
  IMAGE_ACRONYMS = { 
    'SFA' => 'SV6pt5',
    'SCR' => 'SV07'
  }.freeze

  validates :name, :acronym, :released_at, :total_cards, presence: true
  has_many :cards

  def slug
    name.parameterize
  end


  def image_acronym
    IMAGE_ACRONYMS[acronym]
  end
end
