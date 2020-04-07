Rails.application.routes.draw do
  resources :tokens
  get 'admin/admin'
  get 'search' , to: 'sellers#search'
  resources :models
  resources :kilometerdrivens
  resources :variants
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
