Rails.application.routes.draw do




  resources :bookings

  resources :economies
  resources :businesses
  resources :firsts

  resources :flights do
    resources :firsts do
      resources :seats
    end
  end

  resources :flights do
    resources :businesses do
      resources :seats
    end
  end

  resources :flights do
    resources :economies do
      resources :seats
    end
  end

  resources :flights do
    resources :bookings
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
  get 'createfirstseat', to: 'seats#new'
  post 'createfirstseat', to: 'seats#create'
  get 'createbusinessseat', to: 'seats#bnew'
  post 'createbusinessseat', to: 'seats#bcreate'
  #get '/activate',   to: 'account_activations#activate'
  get '/dashboard', to: 'bookings#userbooking'

  get '/bookseat', to: 'bookings#bookseat'
  post '/bookseat', to: 'bookings#bookseat'

  get '/seatselect', to: 'bookings#seatselect'
  post '/seatselect', to: 'bookings#seatselect'
  
  get '/confirm', to: 'bookings#confirm'

  resources :users
  resources :account_activations, only: [:edit]
  resources :password_resets,     only: [:new, :create, :edit, :update]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
