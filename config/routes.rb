Rails.application.routes.draw do
  resources :ledgers, only: [:index, :show, :create, :update, :destroy] do
    resources :credit_cards, only: [:index, :show, :create, :update, :destroy] do
      get :calc_month_interest
    end
  end
end
