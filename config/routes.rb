Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'forum_threads#index'

  resources :forum_threads, only: [:show, :new, :create] do 
    resource :forum_posts, only: [:create]
  end
end
