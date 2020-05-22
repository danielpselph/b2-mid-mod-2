# Studio.destroy_all
# Movie.destroy_all

studio1 = Studio.create(name: "Carolco", location: "Boca Raton, FL")
movie1 = studio1.movies.create(title: "First Blood", year: "1982", genre: "Action")
movie2 = studio1.movies.create(title: "Total Recall", year: "1990", genre: "Science Fiction")

studio2 = Studio.create(name: "Miramax", location: "Buffalo, NY")
movie3 = studio2.movies.create(title: "Pulp Fiction", year: "1994", genre: "Comedy")
movie4 = studio2.movies.create(title: "Chasing Amy", year: "1997", genre: "Drama")

actor1 = Actor.create(name: "John Travolta", age: 60)
actor2 = Actor.create(name: "Bruce Willis", age: 65)
actor3 = Actor.create(name: "Ving Rhames", age: 70)
actor_movie1 = MovieActor.create(movie_id: movie3, actor_id: actor1)
actor_movie2 = MovieActor.create(movie_id: movie3, actor_id: actor2)
actor_movie3 = MovieActor.create(movie_id: movie3, actor_id: actor3)