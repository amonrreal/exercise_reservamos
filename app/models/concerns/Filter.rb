module Filter
  extend ActiveSupport::Concern

  def has_m?
    code.match?("m")
  end
end