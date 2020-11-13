class UsersController < ApplicationController
  
  def index
    matching_users = User.all
    @list_of_users = matching_users.order({ :username => :asc })
    
    render({ :template => "user_templates/index.html.erb" })
  end
  
  def show 
    url_username = params.fetch("path_username")
    matching_usernames = User.where({ :username => url_username})
    @the_user = matching_usernames[0]

    render({ :template => "user_templates/show.html.erb" })
  end

  def delete 
    the_id = params["path_id"]
    the_photo = Photo.where({ :id => the_id})[0]
    the_photo.destroy

    redirect_to("/photos")
  end

  def add 
    input_username = params["input_username"]

    new_user = User.new
    new_user.username = input_username

    new_user.save

    redirect_to("/users/" + input_username)
  end

  def update
    path_username = params["path_username"]
    input_username = params["input_username"]
    
    the_user = User.where({ :username => path_username})[0]
    the_user.username = input_username

    the_user.save

    redirect_to("/users/" + input_username)
  end

end