Rails.application.routes.draw do

  devise_for :users
  root 'shows#index'
  resources :shows do
    resources :comments
  end
  resources :venues
  resources :bands
end
