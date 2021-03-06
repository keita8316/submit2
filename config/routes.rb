Rails.application.routes.draw do
  
 
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'homes#index'  
  
  resources :books do
    resource :favorites, only: [:create, :destroy]
    resources :book_comments, only: [:create, :destroy]
  end
  resources :users do
    # resources :book_comments, only: [:create, :destroy]
  end
  
  get '/home/about', to: 'homes#about', as: 'about'

end
