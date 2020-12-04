class RunsController < ApplicationController
  def index
    matching_runs = Run.all

    @list_of_runs = matching_runs.order({ :created_at => :desc })

    render({ :template => "runs/index.html.erb" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_runs = Run.where({ :id => the_id })

    @the_run = matching_runs.at(0)

    render({ :template => "runs/show.html.erb" })
  end

  def create
    the_run = Run.new
    the_run.city = params.fetch("query_city")
    the_run.start = params.fetch("query_start")
    the_run.end = params.fetch("query_end")
    the_run.distance = params.fetch("query_distance")
    the_run.track_type = params.fetch("query_track_type")
    the_run.hills = params.fetch("query_hills")
    the_run.details = params.fetch("query_details")
    the_run.runner = params.fetch("query_runner")
    the_run.photo = params.fetch("query_photo")

    if the_run.valid?
      the_run.save
      redirect_to("/runs", { :notice => "Run created successfully." })
    else
      redirect_to("/runs", { :notice => "Run failed to create successfully." })
    end
  end

  def update
    the_id = params.fetch("path_id")
    the_run = Run.where({ :id => the_id }).at(0)

    the_run.city = params.fetch("query_city")
    the_run.start = params.fetch("query_start")
    the_run.end = params.fetch("query_end")
    the_run.distance = params.fetch("query_distance")
    the_run.track_type = params.fetch("query_track_type")
    the_run.hills = params.fetch("query_hills")
    the_run.details = params.fetch("query_details")
    the_run.runner = params.fetch("query_runner")
    the_run.photo = params.fetch("query_photo")


    if the_run.valid?
      the_run.save
      redirect_to("/runs/#{the_run.id}", { :notice => "Run updated successfully."} )
    else
      redirect_to("/runs/#{the_run.id}", { :alert => "Run failed to update successfully." })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_run = Run.where({ :id => the_id }).at(0)

    the_run.destroy

    redirect_to("/runs", { :notice => "Run deleted successfully."} )
  end

def favorites 

matching_users = Runner.all

render({ :template => "/runs_templates/favorites.html.erb" })

end 

def filter 

matching_runs = Run.all

@the_city = params.fetch("input_city")
@filtered_runs = matching_runs.where(:city => @the_city)

render({ :template => "/runs/filter.html.erb" })
end 

end
