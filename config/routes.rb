Rails.application.routes.draw do
  resources :ledgers do
    resources :credit_cards
  end
end
