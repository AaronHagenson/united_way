Rails.application.routes.draw do
  devise_for :users
  resources :posts do
    resources :blog_comments
  end
  
  root "posts#index"
  get 'about' => 'pages#about'
  get 'contact' => 'pages#contact'
  get 'admin' => 'pages#admin'
  
end
