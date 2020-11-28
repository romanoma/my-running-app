Rails.application.routes.draw do

get("/login", { :controller => "users", :action => "login"})
get("/homepage/:username", { :controller => "users", :action => "select_run"})
get("/run_index", { :controller => "runs", :action => "index"})
get("/run/:id", { :controller => "runs", :action => "show" })
get("favorite_runs", { :controller => "runs", :action => "favorites" })

end 