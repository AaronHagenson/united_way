Rails.application.routes.draw do
  devise_for :users
  resources :posts
  resources :forum_threads do 
    resources :forum_comments
  end

  
  root "posts#index"
  get 'about' => 'pages#about'
  get 'contact' => 'pages#contact'
  get 'admin' => 'pages#admin'
  
end
