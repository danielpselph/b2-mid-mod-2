class Actor < ApplicationRecord
  has_many :movie_actors
  has_many :movies, through: :movie_actors

  def co_stars
    binding.pry
    # movies.joins(:movie_actors).all
    # self.joins(:movie_actors.all)
    
  end
end