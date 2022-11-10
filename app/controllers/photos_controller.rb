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

end
