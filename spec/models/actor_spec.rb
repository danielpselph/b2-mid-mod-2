require 'rails_helper'

RSpec.describe Movie, type: :model do 
  describe "relationsips" do
    it { should have_many(:movie_actors) }
    it { should have_many(:actors).through(:movie_actors) }
  end
end
  