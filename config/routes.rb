Rails.application.routes.draw do
    resources :users, only: [:show, :create]
    resources :games, only: [:create]
    resources :words, only: [:show, :create]
    resources :images, only: [:show]

    post "/login", to: "users#login"
    get '/current_user', to: 'users#show'
    get '/categories/:id/:language', to: 'categories#show'
    post '/speech', to: 'words#text_to_speech'

end

