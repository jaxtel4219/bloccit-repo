Rails.application.routes.draw do

  devise_for :users
  resources :users, only: [:update]
  resources :advertisements, :questions
  
  resources :topics do
    resources :posts, except: [:index] do
      resources :comments, only: [:create]
    end
  end

    
  
  get 'about' => 'welcome#about' #so we don't have to type welcome/about, just /about
  get 'contact' => 'welcome#contact'

  root to: 'welcome#index'  
end
