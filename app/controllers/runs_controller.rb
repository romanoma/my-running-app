class RunsController < ApplicationController 

def index 

#Parameters: {"input_name"=>"Chicago Magic", "input_city"=>"Chicago", "input_start"=>"Marianos", "input_end"=>"Caca", "input_distance"=>"14", "input_type"=>"Concrete", "input_hills"=>"No", "input_details"=>"Fantastic"}

render({ :template => "runs_templates/index.html.erb" })
end

def show 

render({ :template => "runs_templates/show.html.erb" })
end 

def favorites 

render({ :template => "runs_templates/favorites.html.erb" })
end 

end 
