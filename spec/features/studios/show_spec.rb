require 'rails_helper'

RSpec.describe "Studio show" do
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
    describe 'unique list' do
        it "When I visit a studio's show page
        I see the studio's name and location
        And I see a unique list of all of the actors that have worked on any of this studio's movies." do

        movie3 = Movie.create!(title: "duplicate", creation_year: 2022, genre: 'comedy', studio_id: @studio1.id)
        ma5 = MovieActor.create!(movie_id: movie3.id, actor_id: @actor1.id)
        visit "/studios/#{@studio1.id}"
        expect(page).to have_content("Bugs Bunny").once
        end
    end
end