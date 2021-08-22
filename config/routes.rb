Rails.application.routes.draw do
  devise_for :users

  namespace :user do
    resource :private_api_keys, only: :update
  end

  root to: "index#index"

  get '/index' => 'index#index'

  namespace :api do
    namespace :v1 do
      defaults format: :json do
        resources :ledgers, only: [:index, :show, :create, :update, :destroy] do
          resources :credit_cards, only: [:index, :show, :create, :update, :destroy] do
            get :calculate_month_interest
          end
        end
      end
    end
  end
end
