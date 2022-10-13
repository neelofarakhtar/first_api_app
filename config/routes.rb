Rails.application.routes.draw do
  mount Rswag::Ui::Engine => '/api-docs'
  mount Rswag::Api::Engine => '/api-docs'
 resources :users
 
  namespace :api do
    namespace :v1 do
      resources :posts
    end
  end 
end
