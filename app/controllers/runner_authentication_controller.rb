class RunnerAuthenticationController < ApplicationController
  # Uncomment this if you want to force runners to sign in before any other actions
  # skip_before_action(:force_runner_sign_in, { :only => [:sign_up_form, :create, :sign_in_form, :create_cookie] })

  def sign_in_form
    render({ :template => "runner_authentication/sign_in.html.erb" })
  end

  def create_cookie
    runner = Runner.where({ :email => params.fetch("query_email") }).first
    
    the_supplied_password = params.fetch("query_password")
    
    if runner != nil
      are_they_legit = runner.authenticate(the_supplied_password)
    
      if are_they_legit == false
        redirect_to("/runner_sign_in", { :alert => "Incorrect password." })
      else
        session[:runner_id] = runner.id
      
        redirect_to("/", { :notice => "Signed in successfully." })
      end
    else
      redirect_to("/runner_sign_in", { :alert => "No runner with that email address." })
    end
  end

  def destroy_cookies
    reset_session

    redirect_to("/", { :notice => "Signed out successfully." })
  end

  def sign_up_form
    render({ :template => "runner_authentication/sign_up.html.erb" })
  end

  def create
    @runner = Runner.new
    @runner.email = params.fetch("query_email")
    @runner.password = params.fetch("query_password")
    @runner.password_confirmation = params.fetch("query_password_confirmation")

    save_status = @runner.save

    if save_status == true
      session[:runner_id] = @runner.id
   
      redirect_to("/", { :notice => "Runner account created successfully."})
    else
      redirect_to("/runner_sign_up", { :alert => "Runner account failed to create successfully."})
    end
  end
    
  def edit_profile_form
    render({ :template => "runner_authentication/edit_profile.html.erb" })
  end

  def update
    @runner = @current_runner
    @runner.email = params.fetch("query_email")
    @runner.password = params.fetch("query_password")
    @runner.password_confirmation = params.fetch("query_password_confirmation")
    
    if @runner.valid?
      @runner.save

      redirect_to("/", { :notice => "Runner account updated successfully."})
    else
      render({ :template => "runner_authentication/edit_profile_with_errors.html.erb" })
    end
  end

  def destroy
    @current_runner.destroy
    reset_session
    
    redirect_to("/", { :notice => "Runner account cancelled" })
  end
 
end
