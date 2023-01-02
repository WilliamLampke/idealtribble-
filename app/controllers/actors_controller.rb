class ActorsController < ApplicationController
    def new
        @movie = Movie.find(params[:id])
    end
    def create
        movie = Movie.find(params[:id])
        actor = Actor.create!(name: params[:name], age: params[:age])
        MovieActor.create!(movie_id: movie.id, actor_id: actor.id)
        redirect_to "/movies/#{movie.id}"
    end
end