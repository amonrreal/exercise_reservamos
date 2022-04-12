class HomeController < ApplicationController
  def index
    @form_user = FormUser.new
  end

  def create_form
    @form_user = FormUser.new(
      name: params[:form_user][:name],
      email: params[:form_user][:email]
    )
    if @form_user.valid?
      redirect_to success_path
    else 
      render :index
    end
  end

  def states
    @states = State.recently
  end

  def cities
    @cities = City.recently.includes(:state)
  end

  def filter
    @filtered = State.recently
                      .joins(:cities)
                      .where("cities.code LIKE ?", "%AA%").distinct
  end

  def success
  end
end
