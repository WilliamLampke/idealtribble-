require 'rails_helper'

RSpec.describe Movie do
  describe 'relationships' do
    it {should belong_to :studio}
    it {should have_many :movie_actors}
    it {should have_many(:actors).through(:movie_actors)}
  end
  before :each do
    @studio1 = Studio.create!(name: 'looney toons', location: 'toontown')
    @studio2 = Studio.create!(name: 'fake', location: 'nowhere')

    @movie1 = Movie.create!(title: "rabbit season", creation_year: 1960, genre: "comedy", studio_id: @studio1.id)
    @movie2 = Movie.create!(title: "birdcage", creation_year: 1970, genre: "comdey", studio_id: @studio1.id)
    
    @actor1 = Actor.create!(name: "Bugs Bunny", age: 40)
    @actor2 = Actor.create!(name: "Daffy Duck", age: 41)
    @actor3 = Actor.create!(name: "Tweety", age: 10)
    @actor4 = Actor.create!(name: "Sylvester", age: 11)

    @ma1 = MovieActor.create!(movie_id: @movie1.id, actor_id: @actor1.id)
    @ma2 = MovieActor.create!(movie_id: @movie1.id, actor_id: @actor2.id)
    @ma3 = MovieActor.create!(movie_id: @movie2.id, actor_id: @actor3.id)
    @ma4 = MovieActor.create!(movie_id: @movie2.id, actor_id: @actor4.id)
  end
  describe "age_sort" do
    it 'sorts by age' do
      expect(@movie1.age_sort).to eq([@actor1, @actor2])
    end
  end
  describe "average_age" do
    it 'averages by age' do
      expect(@movie1.average_age).to eq(40)
    end
  end
end
