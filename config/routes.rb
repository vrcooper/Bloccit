Rails.application.routes.draw do
  
  

  

  resources :questions

  
  get 'about' => 'welcome#about'

  root to: 'welcome#index'
end
