Rails.application.routes.draw do

  get "/", to: "users#index"
  get "/users", to: "users#index"
  get "/users/:path_username", to: "users#show"
  get "/add_user", to: "users#add"
  get "/update_user/:path_username", to: "users#update"

  get "/photos", to: "photos#index"
  get "/photos/:path_id", to: "photos#show"
  get "/delete_photo/:path_id", to: "photos#delete"
  get "/add_photo", to: "photos#add"
  get "/update_photo/:path_id", to: "photos#update"
  get "/insert_comment_record", to: "photos#create_comment"

end
