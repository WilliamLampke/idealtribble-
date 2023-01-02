require 'rails_helper'

RSpec.describe "Studio Index" do
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
    describe 'index' do
        it "When I visit the studio index page,
        Then I see all of the studios including name and location,
        And under each studio I see all of the studio's movies
        including the movie's title, creation year, and genre" do 
        
        visit "/studios"
        expect(page).to have_content("Name: looney toons")
        expect(page).to have_content("Location: toontown")
        expect(page).to have_content("Title: rabbit season")
        expect(page).to have_content("Creation_year: 1960")
        expect(page).to have_content("Genre: comedy")
        expect(page).to have_content("Title: birdcage")
        expect(page).to have_content("Creation_year: 1960")
        expect(page).to have_content("Genre: comedy")
        end
    end
end