Rails.application.routes.draw do
  mount Rswag::Ui::Engine => '/api-docs'
  mount Rswag::Api::Engine => '/api-docs'
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  # Defines the root path route ("/")
  root "users#index"

  resources :users, only: [:index, :show] do 
    resources :posts, only: [:index, :show, :new, :create, :destroy] do 
      resources :comments, only: [:index ]
    end
  end

  resources :likes, only: [:create]

  get 'users/:user_id/posts/:id/newcomment', to: 'comments#new', as: 'new_comment'
  post 'users/:user_id/posts/:id/comment', to: 'comments#create', as: 'comment'
  delete 'users/:user_id/posts/:id/comment', to: 'comments#destroy'
  
  post 'users/:user_id/posts/:id/comment_api', to: 'api#comment_api'
  get 'users/:user_id/posts/:id/comments_index', to: 'api#comments_index'
  get 'users/:user_id/posts/:id/posts_index', to: 'api#posts_index'
end