Rails.application.routes.draw do
  devise_for :users
  resources :posts do
    resources :blog_comments
  end
  
  root "posts#index"
  
end
