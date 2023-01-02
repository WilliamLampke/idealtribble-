class CreateMovieActors < ActiveRecord::Migration[5.2]
  def change
    create_table :movie_actors do |t|
      t.bigint :movie_id
      t.bigint :actor_id
    end
  end
end
