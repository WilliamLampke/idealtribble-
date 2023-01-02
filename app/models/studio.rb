class Studio < ApplicationRecord
  has_many :movies
  has_many :actors, through: :movie_actors, through: :movies

  def find_actors
    actors.distinct
  end
end
