class MoviesController < ApplicationController
  def index
    @movies = Movie.all
  end

  def show
    @movie = Movie.find(params[:id])
    render("movies/show.html.erb")
  end

  def new_form

    render("movies/new_form.html.erb")
  end

  def create_row
    m = Movie.new
    m.title = params[:the_title]
    m.year = params[:the_year]
    m.duration = params[:the_duration]
    m.description = params[:the_description]
    m.image_url = params[:the_image_url]
    m.director_id = params[:director_id]
    m.save

    redirect_to("/movies/show/#{m.id}")
  end

  def edit_form
    @movie = Movie.find(params[:id])
    render("movies/edit_form.html.erb")
  end

  def update_row
    m = Movie.find(params[:id])
    m.title = params[:title]
    m.year = params[:year]
    m.duration = params[:duration]
    m.description = params[:description]
    m.image_url = params[:image_url]
    m.director_id = params[:director_id]
    m.save
    redirect_to("/movies/show/#{m.id}")
  end

  def destroy
    @movie = Movie.find(params[:id])

    m = Movie.find(params[:id])
    m.destroy
    render("movies/destroy.html.erb")
  end
end
