Rails.application.routes.draw do
  resources :posts do
    resources :blog_comments
  end
  
  root "posts#index"
  
end
