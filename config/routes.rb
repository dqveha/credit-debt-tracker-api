Rails.application.routes.draw do
  # devise_for :users

  root to: "index#index"

  get '/index' => 'index#index'

  # devise_for :users, controllers: {
  #   registrations: 'users/registrations'
  # }
  # root to: "devise/sessions#new"

  # as user do
  #   get   '/signup'   => 'users/registrations#new', as: :new_user_registration
  #   post  '/signup'   => 'users/registrations#create', as: :user_registration
  # end

  # devise_scope :user do
  #   root to: 'devise/sessions#new'
  # end

  resources :ledgers, only: [:index, :show, :create, :update, :destroy] do
    resources :credit_cards, only: [:index, :show, :create, :update, :destroy] do
      get :calculate_month_interest
    end
  end
end
