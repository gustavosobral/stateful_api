Rails.application.routes.draw do
  mount_devise_token_auth_for 'User', at: 'v1/auth'

  namespace :v1, defaults: { format: :json } do
    get '/users/:id', to: 'users#show'

    resources :models, except: [:new, :edit] do
      get '/states',  to: 'states#index'
      post '/states', to: 'states#update'

      member do
        post 'walk_state'
      end
    end
  end
end
