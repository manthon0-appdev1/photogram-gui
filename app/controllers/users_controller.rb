class UsersController < ApplicationController

  def index
    matching_users = User.all
    @list_of_users = matching_users.order({:username => :asc})
    render({:template => "user_templates/index.html.erb"})
  end

def show
input_un = params.fetch("path_username")
  matching_usernames = User.where({:username => input_un})
  @the_user = matching_usernames.first

  if @the_user == nil
    redirect_to("/")
  else
    render({:template => "user_templates/show.html.erb"})
  end
end

def add
  #Parameters: {"input_user"=>"matt4"}
  new_username = params.fetch("input_user")
  added_user = User.new
  added_user.username = new_username
  added_user.save
  redirect_to("/users/" + added_user.username.to_s)
end

end
