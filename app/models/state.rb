class State < ApplicationRecord
  include Filter
  has_many :cities

  validates :name, presence: true
  
  validates :code, presence: true
  validates :code, place_code: true
  validates :code, uniqueness: true
end
