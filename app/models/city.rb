class City < ApplicationRecord
  belongs_to :state

  validates :name, presence: true
  validates :code, presence: true
  validates :code, place_code: true

  def has_m?
    self.code.match?("m")
  end
end
