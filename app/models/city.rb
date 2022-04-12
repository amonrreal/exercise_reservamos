class City < ApplicationRecord
  include Filter  
  belongs_to :state

  validates :name, presence: true

  validates :code, presence: true
  validates :code, place_code: true
  validates :code, uniqueness: true
end
