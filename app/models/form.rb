class Form
  include ActiveModel::Model
  attr_accessor :name, :email

  validates :name, presence: true
  validates :email, presence: true
  
  validates :email, email: true
end