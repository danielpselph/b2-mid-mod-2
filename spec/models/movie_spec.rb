require 'rails_helper'

RSpec.describe Movie, type: :model do 
  describe "relationsips" do
    it { should belong_to(:studio) } 
    it { should have_many(:movie_actors) }
    it { should have_many(:actors).through(:movie_actors) }
  end

  describe "methods" do
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
    it "#sort_by_age" do
      expect(@movie3.sort_by_age).to eq([@actor1, @actor2, @actor3]) 
    end
    it "#average_age" do
      expect(@movie3.average_age).to eq(65) 
    end
    
    
  end
  
end
  