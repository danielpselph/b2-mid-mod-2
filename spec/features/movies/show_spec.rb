require 'rails_helper'

RSpec.describe "movie show page" do
  context "as a visitor" do
    before(:each) do
      @studio2 = Studio.create(name: "Miramax", location: "Buffalo, NY")
      @movie3 = @studio2.movies.create(title: "Pulp Fiction", year: "1994", genre: "Comedy")
      @actor1 = Actor.create(name: "John Travolta", age: 60)
      @actor2 = Actor.create(name: "Bruce Willis", age: 65)
      @actor3 = Actor.create(name: "Ving Rhames", age: 70)
      @actor4 = Actor.create(name: "Uma Thurman", age: 55)
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

    it "can add an actor to a movie" do

      visit "/movies/#{@movie3.id}"
      
      fill_in :actor, with: "Uma Thurman"
      click_button "Submit"

      expect(current_path).to eq("/movies/#{@movie3.id}") 
      expect(page).to have_content(@actor4.name) 
      expect(page).to have_content(@actor1.name) 
      expect(page).to have_content(@actor2.name) 
      expect(page).to have_content(@actor3.name) 
    end
    
  end
end

# I see a form for an actors name
# and when I fill in the form with an existing actor's name
# I am redirected back to that movie's show page
# And I see the actor's name listed
# (This should not break story 3, You do not have to test for a sad path)