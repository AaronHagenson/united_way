Rails.application.routes.draw do
  devise_for :users
  resources :posts 

  
  root "posts#index"
  get 'about' => 'pages#about'
  get 'contact' => 'pages#contact'
  get 'admin' => 'pages#admin'
  
end
