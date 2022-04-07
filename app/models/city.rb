class City < ApplicationRecord
  CODE_FORMAT = /\A[[:alpha:]]{2}+_[\d]{2}\z/
  validates_presence_of :name, :code
  validates_format_of :code, with: CODE_FORMAT

  belongs_to :state
end
