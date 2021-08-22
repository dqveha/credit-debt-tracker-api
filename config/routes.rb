Rails.application.routes.draw do
  get '/index' => 'index#index'

  root to: "index#index"
  
  devise_for :users

  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end

  namespace :user do
    resource :private_api_keys, only: :update
  end



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
