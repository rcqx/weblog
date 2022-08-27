Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "users#index"

  resources :users, only: [:index, :show] do 
    # get 'posts/new', to: 'posts#new', as: 'new_post' #new
    # post 'posts', to: 'posts#create' #create
    resources :posts, only: [:index, :show, :new, :create]
  end

end