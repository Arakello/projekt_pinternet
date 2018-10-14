Rails.application.routes.draw do
  resources :images
  root 'images#new'
end
