require 'rails_helper'

RSpec.describe 'Movie Show' do
  before :each do
    @studio1 = Studio.create!(name: 'looney toons', location: 'toontown')
    @studio2 = Studio.create!(name: 'fake', location: 'nowhere')

    @movie1 = Movie.create!(title: 'rabbit season', creation_year: 1960, genre: 'comedy', studio_id: @studio1.id)
    @movie2 = Movie.create!(title: 'birdcage', creation_year: 1970, genre: 'comdey', studio_id: @studio1.id)
    @movie3 = Movie.create!(title: 'fakemovie', creation_year: 2022, studio_id: @studio2.id)

    @actor1 = Actor.create!(name: 'Bugs Bunny', age: 40)
    @actor2 = Actor.create!(name: 'Daffy Duck', age: 41)
    @actor3 = Actor.create!(name: 'Tweety', age: 10)
    @actor4 = Actor.create!(name: 'Sylvester', age: 11)

    @ma1 = MovieActor.create!(movie_id: @movie1.id, actor_id: @actor1.id)
    @ma2 = MovieActor.create!(movie_id: @movie1.id, actor_id: @actor2.id)
    @ma3 = MovieActor.create!(movie_id: @movie2.id, actor_id: @actor3.id)
    @ma4 = MovieActor.create!(movie_id: @movie2.id, actor_id: @actor4.id)
  end
  describe 'show' do
    it "When I visit a movie's show page.
        I see the movie's title, creation year, and genre,
        and a list of all its actors from youngest to oldest.
        And I see the average age of all of the movie's actors" do
      visit "/movies/#{@movie1.id}"
      expect(page).to have_content("rabbit season")
      expect(page).to have_content("1960")
      expect(page).to have_content("comedy")
      expect(@actor1.name).to appear_before(@actor2.name)
      expect(page).to have_content("Average Actor Age: 40")
    end
  end
  describe 'add actor' do
    it "When I visit a movie show page,
    I do not see any actors listed that are not part of the movie
    And I see a form to add an actor to this movie
    When I fill in the form with the ID of an actor that exists in the database
    And I click submit
    Then I am redirected back to that movie's show page
    And I see the actor's name is now listed" do
      visit "/movies/#{@movie3.id}"
      click_on "Add a Actor"
      fill_in :name, with: "fakename"
      fill_in :age, with: "1"
      click_on "Submit"
      expect(page).to have_content("Name: fakename")
      expect(page).to have_content("Age: 1")

    end
  end
end
