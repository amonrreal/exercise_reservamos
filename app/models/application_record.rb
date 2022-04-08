class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true
  scope :recently, -> { order(updated_at: :desc) }
end
