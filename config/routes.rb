Rails.application.routes.draw do




  resources :firsts

  resources :flights do
    resources :firsts
  end



  get 'password_resets/new'
  get 'password_resets/edit'
  root 'static_pages#home'
  get  '/help',    to: 'static_pages#help'
  get  '/about',   to: 'static_pages#about'
  get  '/signup',  to: 'users#new'
  #post '/signup',  to: 'users#create'
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
  get '/createnewfirst', to: 'firsts#new'
  post '/createnewfirst', to: 'firsts#create'
  post '/flights/:flight_id/firsts', to: 'firsts#create'
  #get '/activate',   to: 'account_activations#activate'
  resources :users
  resources :account_activations, only: [:edit]
  resources :password_resets,     only: [:new, :create, :edit, :update]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
