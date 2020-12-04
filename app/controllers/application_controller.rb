class ApplicationController < ActionController::Base
  before_action(:load_current_runner)
  
  # Uncomment this if you want to force runners to sign in before any other actions
  # before_action(:force_runner_sign_in)
  
  def homepage 

    redirect_to("/runner_sign_up", { :notice => "Runner account created successfully."})
  end 

  def load_current_runner
    the_id = session[:runner_id]
    @current_runner = Runner.where({ :id => the_id }).first
  end
  
  def force_runner_sign_in
    if @current_runner == nil
      redirect_to("/runner_sign_in", { :notice => "You have to sign in first." })
    end
  end

end
