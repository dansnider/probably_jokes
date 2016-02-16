Rails.application.routes.draw do

  root to: 'static_pages#index'
  get '/tweet', to: 'tweets#random'
  get '/topten', to: 'tweets#top_ten'
  put '/tweet', to: 'tweets#vote'

end
