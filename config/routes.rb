Rails.application.routes.draw do
  # set root to homepage
  root 'rooms#index'

  # devise routes
  devise_for :users, controllers: { registrations: "users/registrations", sessions: "users/sessions", passwords: "users/passwords"}

  resources :homes, only: [:index]

  resources :bookings, only: [:index]

  resources :rooms, only: [:index] do
  	resources :bookings, except: [:index, :update, :edit]
  end

  # routes for api's
  namespace :api, constraints: {format: :json} do
  	namespace :v1 do
      resources :users, only: [:show] do
        collection do
          post 'sign_in', to: 'users#log_in'
          delete 'sign_out', to: 'users#log_out'
        end
      end
      resources :rooms, only: [:index]
  	 	resources :bookings, only: [:show]
  	end
  end
end
