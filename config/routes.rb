Rails.application.routes.draw do
  resources :products do
    # resources :pricings
    member do
      get :pricings
    end
  end
end
