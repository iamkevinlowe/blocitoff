Rails.application.routes.draw do

  devise_for :users
  resources :users, only: [:show]
  get 'about' => 'welcome#about'
  root 'welcome#index'

end
