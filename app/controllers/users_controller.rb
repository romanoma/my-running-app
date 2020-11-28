class UsersController < ApplicationController 

  def login 

    render({ :template => "users_templates/login.html.erb" })
  end 

  def select_run

    render({ :template => "users_templates/form.html.erb" })
  end 

  def index
    @users = User.all
  end


end