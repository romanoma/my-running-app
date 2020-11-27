class RunsController < ApplicationController 

def index 

render({ :template => "runs_templates/index.html.erb" })
end

def show 

render({ :template => "runs_templates/show.html.erb" })
end 

end 
