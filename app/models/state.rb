class State < ApplicationRecord
  has_many :cities

  validates :name, presence: true
  validates :code, presence: true
  validates :code, place_code: true

  def has_m?
    self.code.match?("m")
  end
end
