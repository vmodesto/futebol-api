Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      get 'championships', to: 'championships#index'
    end
  end
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
