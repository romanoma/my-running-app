Rails.application.routes.draw do

#get("/login", { :controller => "users", :action => "login"})
get("/", { :controller => "application", :action => "homepage"})
get("/homepage", { :controller => "users", :action => "select_run"})
get("/run_index", { :controller => "runs", :action => "index"})
get("/run/:id", { :controller => "runs", :action => "show" })
get("/favorite_runs", { :controller => "runs", :action => "favorites" })

  # Routes for the Runner account:

  # SIGN UP FORM
  get("/runner_sign_up", { :controller => "runner_authentication", :action => "sign_up_form" })        
  # CREATE RECORD
  post("/insert_runner", { :controller => "runner_authentication", :action => "create"  })
      
  # EDIT PROFILE FORM        
  get("/edit_runner_profile", { :controller => "runner_authentication", :action => "edit_profile_form" })       
  # UPDATE RECORD
  post("/modify_runner", { :controller => "runner_authentication", :action => "update" })
  
  # DELETE RECORD
  get("/cancel_runner_account", { :controller => "runner_authentication", :action => "destroy" })

  # ------------------------------

  # SIGN IN FORM
  get("/runner_sign_in", { :controller => "runner_authentication", :action => "sign_in_form" })
  # AUTHENTICATE AND STORE COOKIE
  post("/runner_verify_credentials", { :controller => "runner_authentication", :action => "create_cookie" })
  
  # SIGN OUT        
  get("/runner_sign_out", { :controller => "runner_authentication", :action => "destroy_cookies" })
             
  #------------------------------

  # Routes for the Run resource:

  # CREATE
  post("/insert_run", { :controller => "runs", :action => "create" })
          
  # READ
  get("/runs", { :controller => "runs", :action => "index" })
  
  get("/runs/:path_id", { :controller => "runs", :action => "show" })
  
  # UPDATE
  
  post("/modify_run/:path_id", { :controller => "runs", :action => "update" })
  
  # DELETE
  get("/delete_run/:path_id", { :controller => "runs", :action => "destroy" })

  #------------------------------


end 