class UsersController < ApplicationController 


  def select_run

    render({ :template => "users_templates/form.html.erb" })
  end 

  def index
    @users = User.all
  end


end