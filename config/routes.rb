Rails.application.routes.draw do

  resources :posts, :advertisements
  
  get 'about' => 'welcome#about' #so we don't have to type welcome/about, jsut /about
  get 'contact' => 'welcome#contact'

  root to: 'welcome#index'  
end
