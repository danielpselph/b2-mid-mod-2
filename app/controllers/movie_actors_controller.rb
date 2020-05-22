class MovieActorsController < ApplicationController
  def create
    movie = Movie.find(params[:movie_id])
    # binding.pry
    actor = Actor.find_by(name: params[:actor])
    # binding.pry
    MovieActor.create(movie_id: movie.id, actor_id: actor.id)
    redirect_to "/movies/#{movie.id}"
  end
  
end