Rails.application.routes.draw do
  resources :orders, only: :create
  resource :webhooks, only: [] do
    post :artistripe
  end
end
