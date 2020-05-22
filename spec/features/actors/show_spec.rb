require 'rails_helper'

RSpec.describe "actor show page" do
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

    it "can see actors name age and list of other actors worked with" do

      visit "/actors/#{@actor1.id}"
      
    end
    
  end
end