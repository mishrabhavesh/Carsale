Rails.application.routes.draw do
  resources :locations, except: [:show,:edit,:update,:destroy]
  resources :car_costs, except: [:show,:destroy]
  resources :tokens do 
      collection do
        get 'update_status'
        get 'my_add'
      end
  end
  get 'status_search' ,  to:'tokens#status_search'
  get 'admin/admin'
  resources :models, except: [:show]
  resources :kilometer_drivens, except: [:show]
  resources :variants, except: [:show]
 

  resources :registration_states, except: [:show]
  resources :brands, except: [:show]
  resources :cities, except: [:show]
  resources :sellers do 
              collection do
                get :toggle_status
                get :approve
                get :reject
                get 'search_city'
                get 'search_brand'
                get 'search_registration_year'
                get 'search_variant'
                get 'search_registration_state'
                get 'search_kilometer_driven'
                get 'search_model'
              end
              member do
                get :toggle_status
                get :approve
                get :reject
              end
            end
    
  devise_for :users,path: '', path_names: {sign_in: 'login', sign_out: 'logout' }
  root to:'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
