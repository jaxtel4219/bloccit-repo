Rails.application.routes.draw do

  resources :posts, :advertisements, :questions
  
  get 'about' => 'welcome#about' #so we don't have to type welcome/about, just /about
  get 'contact' => 'welcome#contact'

  root to: 'welcome#index'  
end
