Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      get 'championships', to: 'championships#index'
      get 'championships/:id', to: 'championships#show'
      get 'championships/current_issue/only', to: 'championships#current_issue'
      get 'users/championships', to: 'users#championships'
      post 'users/championships/:id', to: 'users#new_championship'
      delete 'users/championships/:id', to: 'users#destroy_championship'
      post 'users', to: 'users#create'
      post 'login', to: 'login#create'
    end
  end
  
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
