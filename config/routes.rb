Rails.application.routes.draw do

  get "/users", to: "users#index"
  get "/users/:path_username", to: "users#show"

end
