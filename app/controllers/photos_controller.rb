class PhotosController < ApplicationController

  def index
    matching_photos = Photo.all
    @list_of_photos = matching_photos
    render({:template => "photo_templates/index.html.erb"})
  end

  def show
    input_photo = params.fetch("path_photo")
      matching_photos = Photo.where({:id => input_photo})
      @the_photo = matching_photos.first
    
    render({:template => "photo_templates/show.html.erb"})
      
    end

def delete
  the_id = params.fetch("path_id")
  the_photo = Photo.where({:id => the_id}).first  
  the_photo.destroy
#render({:template => "photo_templates/delete.html.erb"})
redirect_to("/photos")
end

def insert
#  Parameters: {"query_image"=>"a", "query_caption"=>"b", "query_owner_id"=>"c"}
# {"query_image"=>"https://www.chicagobooth.edu/boothsitecore/img/admit/hpr_login_big.jpg", "query_caption"=>"booth", "query_owner_id"=>"117"}

input_image = params.fetch("query_image")
input_caption = params.fetch("query_caption")
input_owner_id = params.fetch("query_owner_id")

a_new_photo = Photo.new
a_new_photo.image = input_image
a_new_photo.caption = input_caption
a_new_photo.owner_id = input_owner_id
a_new_photo.save
#render({:template => "photo_templates/insert.html.erb"})
redirect_to("/photos/" + a_new_photo.id.to_s)
end

def update
 # Parameters: {"input_image"=>"https://robohash.org/modiadipiscicorrupti.png?size=300x300&set=set1", "input_caption"=>"mmmm", "modify_id"=>"633"}
the_id = params.fetch("modify_id")
new_image = params.fetch("input_image")
new_caption = params.fetch("input_caption")
the_photo = Photo.where({:id => the_id}).first
the_photo.image = new_image
the_photo.caption = new_caption
the_photo.save
redirect_to("/photos/" + the_photo.id.to_s)
end

def add_comment
  #Parameters: {"input_photo_id"=>"633", "input_author_id"=>"117", "input_body"=>"awesome!\r\n", "modify_id"=>"633"}
  this_comment = Comment.new
  this_comment.photo_id = params.fetch("input_photo_id")
  this_comment.body = params.fetch("input_body")
  this_comment.author_id = params.fetch("input_author_id")
  #this_comment.commenter = User.where({:id => commenter_id}).first
  this_comment.save
  #render({:template => "photo_templates/add_comment.html.erb"})
  redirect_to("/photos/" + this_comment.photo_id.to_s)
end

end
