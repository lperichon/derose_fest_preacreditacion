DeRoseFestPreAcreditacion::Application.routes.draw do
  devise_for :users
  devise_scope :user do
    get "/login", :to => "devise/cas_sessions#new"
    post '/logout', to: "devise/cas_sessions#destroy"
  end

  resources :participants
  root to: 'participants#index'
end
