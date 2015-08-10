Rails.application.routes.draw do
  

 

  devise_for :users
  
  resources :summaries do
    resources :posts, except: [:index]
  end

  
  get 'about' => 'welcome#about'

  root to: 'welcome#index'
end
