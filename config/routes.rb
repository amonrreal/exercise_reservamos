Rails.application.routes.draw do
  get '/states', to: 'home#states'
  get '/cities', to: 'home#cities'
  get '/filter', to: 'home#filter'
  get '/success', to: 'home#success'
  
  post '/create-form', to: 'home#create_form'
  root to: 'home#index'
end
