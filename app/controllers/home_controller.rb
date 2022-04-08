class HomeController < ApplicationController
  def index
    @form = Form.new
  end

  def create_form
    @form = Form.new(
      name: params[:form][:name],
      email: params[:form][:email]
    )
    if @form.valid?
      redirect_to success_path
    else 
      render :index
    end
  end

  def states
    @states = State.recently
  end

  def cities
    @cities = City.all.includes(:state).order(updated_at: :desc)
  end

  def filter
    @states = State.recently
    @filtered = filtered
  end

  def success
  end

  private

  def filtered
    items = []
    @states.each do |state|
      # revisar com poder hacer esto mas corto, optimizar
      state.cities.each do |city|
        if city.code.match?("AA")
          items << city
        end
      end
    end
    items
  end
end
