Rails.application.routes.draw do
  devise_for :users,
    :skip => [:registrations, :sessions]

  as user do
    get   '/signup'   => 'users/registrations#new', as: :new_user_registration
    post  '/signup'   => 'users/registrations#create', as: :user_registration
  end

  devise_scope :user do
    root to: 'users/registrations#new'
  end

  resources :ledgers, only: [:index, :show, :create, :update, :destroy] do
    resources :credit_cards, only: [:index, :show, :create, :update, :destroy] do
      get :calculate_month_interest
    end
  end
end
