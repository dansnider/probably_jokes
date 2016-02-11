Rails.application.routes.draw do

  root to: 'static_pages#index'
  get '/tweet', to: 'tweets#random'
  put '/tweet', to: 'tweets#vote'

end
