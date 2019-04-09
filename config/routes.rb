Rails.application.routes.draw do
  resources :likes
  resources :friendships
  resources :follows
  resources :ingredient_uses
  resources :recipes
  resources :ingredients
  resources :chefs

  get '/', to: 'chefs#index', as:'home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
