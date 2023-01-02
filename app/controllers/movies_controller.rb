class MoviesController < ApplicationController
    def show
        @movie = Movie.find(params[:id])
        @sorted = @movie.age_sort
        @avg = @movie.average_age
    end
end