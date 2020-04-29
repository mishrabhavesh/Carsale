Rails.application.routes.draw do
  resources :locations, except: [:show,:edit,:update,:destroy]
  resources :car_costs, except: [:show,:destroy]
  resources :tokens, except: [:destroy]
  get 'admin/admin'
  resources :models, except: [:show]
  resources :kilometer_drivens, except: [:show]
  resources :variants, except: [:show]
  get 'search_city' , to: 'sellers#search_city'
  get 'search_brand', to: 'sellers#search_brand'
  get 'search_registration_year', to: 'sellers#search_reg_year'
  get 'search_variant', to: 'sellers#search_variant'
  get 'search_registration_state', to: 'sellers#search_reg_state'
  get 'search_kilometer', to: 'sellers#search_kilometer_driven'
  get 'search_model', to: 'sellers#search_model'
  resources :registration_states, except: [:show]
  resources :brands, except: [:show]
  resources :cities, except: [:show]
  resources :sellers, except: [:show,:edit,:destroy,:update]
  devise_for :users,path: '', path_names: {sign_in: 'login', sign_out: 'logout' }
  root to:'pages#home'
  get 'status_search' ,  to:'tokens#status_search'
  get 'my_add', to: 'tokens#my_add'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
