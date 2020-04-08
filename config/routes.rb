Rails.application.routes.draw do
  resources :tokens
  get 'admin/admin'
  resources :models
  resources :kilometerdrivens
  resources :variants
  get 'search_city' , to: 'sellers#search_city'
  get 'search_brand', to: 'sellers#search_brand'
  get 'search_registration_year', to: 'sellers#search_reg_year'
  get 'search_variant', to: 'sellers#search_variant'
  get 'search_registration_state', to: 'sellers#search_reg_state'
  get 'search_kilometer', to: 'sellers#search_kilometer_driven'

  resources :registrationstates
  resources :registrationyears
  resources :brands
  resources :cities
  resources :sellers
  devise_for :users,path: '', path_names: {sign_in: 'login', sign_out: 'logout' }
  root to:'pages#home'
  get 'about', to: 'pages#about'
  get 'status_search' ,  to:'tokens#status_search'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
