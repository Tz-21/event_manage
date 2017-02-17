Rails.application.routes.draw do
  devise_for :users, :controllers => {
                                        registrations: 'users/registrations',
                                        confirmations: 'users/confirmations',
                                        passwords: 'users/passwords',
                                        sessions: 'users/sessions',
                                        unlocks: 'users/unlocks'
                                      }
  root "public#index"

  namespace :backend do
    resources :users, only: [:edit, :update]
    resources :products
  end

  namespace :admin do
    resources :users, only: [:edit, :update]
    resources :clients
  end
end
