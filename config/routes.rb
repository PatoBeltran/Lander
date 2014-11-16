Rails.application.routes.draw do

  constraints(Subdomain) do
    get "/" => "teams#show"
    resources :channels, only: [:create, :update, :destroy]
    resources :invitations, only: [:create]

    namespace :api do
      api_version(:module => "V1", :header => {:name => "Accept", :value => "application/vnd.lander.io; version=1", default: true}) do
        resources :links, only: [:create]
      end
    end
  end

  devise_for :users

  root to: "teams#new"

  resources :teams, only: [:new, :create]
end
