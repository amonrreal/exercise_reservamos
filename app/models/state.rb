class State < ApplicationRecord
  validates_presence_of :name, :code
  validates :code, code_format: true

  has_many :cities
end
