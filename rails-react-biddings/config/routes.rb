Rails.application.routes.draw do

  post "/login" => "sessions#create"
  delete "/logout" => "sessions#destroy"
  get "/profile" => "users#profile"


  scope '/api' do
    resources :sessions
    resources :auctions
    resources :biddings
    resources :users

  
    
  end

  # resource :session, only: [:create, :destroy]

  # resources :users, only:[] do
  #   get :current, on: :collection
  # end


  #     resources :users, only: [:create, :show, :destroy]
  #     resources :auctions, only: [:create, :show, :index] do
  #       resources :biddings, only: [:create, :destroy, :index]
  #   end
end
