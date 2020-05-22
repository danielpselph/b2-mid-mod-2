require 'rails_helper'

RSpec.describe "studio index page" do
  context "as a visitor" do
    before(:each) do
      @studio1 = Studio.create(name: "Carolco", location: "Boca Raton, FL")
      @movie1 = @studio1.movies.create(title: "First Blood", year: "1982", genre: "Action")
      @movie2 = @studio1.movies.create(title: "Total Recall", year: "1990", genre: "Science Fiction")

      @studio2 = Studio.create(name: "Miramax", location: "Buffalo, NY")
      @movie3 = @studio2.movies.create(title: "Pulp Fiction", year: "1994", genre: "Comedy")
      @movie4 = @studio2.movies.create(title: "Chasing Amy", year: "1997", genre: "Drama")
    end

    it "can see a list of all studios and their movies" do
      
      visit "/studios"

      within ".studio-#{@studio1.id}" do 
        expect(page).to have_content(@studio1.name)
        expect(page).to have_content(@movie1.title)
        expect(page).to have_content(@movie2.title)
      end

      within ".studio-#{@studio2.id}" do 
        expect(page).to have_content(@studio2.name) 
        expect(page).to have_content(@movie3.title)
        expect(page).to have_content(@movie4.title)
      end
    end
  end
end

# I see a list of all of the movie studios
# And underneath each studio, I see the names of all of its movies.