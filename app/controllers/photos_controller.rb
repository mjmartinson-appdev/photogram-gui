class PhotosController < ApplicationController

  def index 
    matching_photos = Photo.all
    @list_of_photos = matching_photos.order({ :created_at => :desc})
    
    render({ :template => "photo_templates/index.html.erb"})
  end

  def show 
    url_id = params.fetch("path_id")
    matching_photos = Photo.where({ :id => url_id})

    @the_photo = matching_photos[0]

    render({ :template => "photo_templates/show.html.erb"})
  end

  def delete 
    the_id = params["path_id"]
    the_photo = Photo.where({ :id => the_id})[0]
    the_photo.destroy

    redirect_to("/photos")
  end

  def add 
    input_img = params["input_img_link"]
    input_caption = params["input_img_caption"]
    input_owner_id = params["input_owner_id"]

    new_photo = Photo.new
    new_photo.image = input_img
    new_photo.caption = input_caption
    new_photo.owner_id = input_owner_id

    new_photo.save

    redirect_to("/photos/" + new_photo.id.to_s)
  end

  def update
    img_id = params["path_id"]
    input_img = params["input_image"]
    input_caption = params["input_caption"]

    the_photo = Photo.where({ :id => img_id})[0]
    the_photo.image = input_img
    the_photo.caption = input_caption

    the_photo.save

    redirect_to("/photos/" + img_id)
  end

  def create_comment
    img_id = params["input_photo_id"]
    author_id = params["input_author_id"]
    input_body = params["input_body"]

    new_comment = Comment.new
    new_comment.photo_id = img_id
    new_comment.author_id = author_id
    new_comment.body = input_body

    new_comment.save

    redirect_to("/photos/" + img_id)
  end

end