Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'patients#index', as: 'home'


  #bandimas
  get 'login', to: 'sessions#new'
  delete 'logout', to: 'sessions#destroy'
  post 'login', to: 'sessions#create'

  get 'appointments' => 'appointments#index', as: 'appointments'

  get 'doctors' => 'doctors#index', as: 'doctors'

  resources :appointments do
    collection do
      match 'search' => 'appointments#search', via: [:get, :post], as: :search
    end
  end


  resources :doctors do
    resources :patients
  end

  #resources :appointments

  #resources :records
  

  resources :patients do
  	resources :records
  end

  resources :patients do
    resources :appointments
  end

  resources :doctors do
    resources :appointments
  end


end
