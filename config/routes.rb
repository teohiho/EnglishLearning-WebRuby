Rails.application.routes.draw do



  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'

  get '/help', to: 'static_pages#help'

  get '/about', to: 'static_pages#about'

  get '/contract', to: 'static_pages#contract'

  get 'users/show' 

  

  get  '/signup',  to: 'users#new'
  post '/signup',  to: 'users#create'



  get 'lesson/:id/words/new', to: 'words#new' , as: :create_word
  post '/words/create'


  get '/lesson/show'
  get '/lesson/quiz'
  get '/lesson/new'
  post '/lesson/submit', to: 'lesson#submit' # for ajax
  post 'lesson/create'
  delete 'lesson/:id', to: 'lesson#destroy'

    root 'static_pages#home'
  #root 'application#hello' 

  get "search(/:search)", to: "searches#index", as: :search

  get '/wordlists/show'

  resources :users do
    member do
      get :following, :followers
    end
  end
  resources :lesson
  resources :users
  resources :microposts,          only: [:create, :destroy]
  resources :words,               only: [:create, :destroy]
  resources :relationships,       only: [:create, :destroy]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
