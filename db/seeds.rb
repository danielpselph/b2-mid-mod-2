Studio.destroy_all
Movie.destroy_all

studio1 = Studio.create(name: "Carolco", location: "Boca Raton, FL")
movie1 = studio1.movies.create(title: "First Blood", year: "1982", genre: "Action")
movie2 = studio1.movies.create(title: "Total Recall", year: "1990", genre: "Science Fiction")

studio2 = Studio.create(name: "Miramax", location: "Buffalo, NY")
movie3 = studio2.movies.create(title: "Pulp Fiction", year: "1994", genre: "Comedy")
movie4 = studio2.movies.create(title: "Chasing Amy", year: "1997", genre: "Drama")