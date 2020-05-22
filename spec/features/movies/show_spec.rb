require 'rails_helper'

RSpec.describe "movie show page" do
  context "as a visitor" do
    before(:each) do
      @studio2 = Studio.create(name: "Miramax", location: "Buffalo, NY")
      @movie3 = @studio2.movies.create(title: "Pulp Fiction", year: "1994", genre: "Comedy")
      @actor1 = Actor.create(name: "John Travolta", age: 60)
      @actor2 = Actor.create(name: "Bruce Willis", age: 65)
      @actor3 = Actor.create(name: "Ving Rhames", age: 70)
      MovieActor.create(movie_id: @movie3.id, actor_id: @actor1.id)
      MovieActor.create(movie_id: @movie3.id, actor_id: @actor2.id)
      MovieActor.create(movie_id: @movie3.id, actor_id: @actor3.id)
    end

    it "can see title, year and genre" do
      
      visit "/movies/#{@movie3.id}"

      expect(page).to have_content(@movie3.title) 
      expect(page).to have_content(@movie3.year) 
      expect(page).to have_content(@movie3.genre) 
    end

    it "list of all actors youngest to oldest" do
      
      visit "/movies/#{@movie3.id}"

      expect(page).to have_content(@actor1.name) 
      expect(page).to have_content(@actor2.name) 
      expect(page).to have_content(@actor3.name) 

    end

    it "can see average age of actors" do
      
      visit "/movies/#{@movie3.id}"

      expect(page).to have_content("Average Age of Actors: 65") 

    end
  end
end

# and a list of all its actors from youngest to oldest.
# And I see the average age of all of the movie's actors