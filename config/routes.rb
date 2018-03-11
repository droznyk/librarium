Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'static_pages#home'
  resources :libraries
  get '/about', to: 'static_pages#about'
  get 'contact', to: 'static_pages#contact'
end
