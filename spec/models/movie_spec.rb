require 'rails_helper'

RSpec.describe Movie, type: :model do 
  describe "relationsips" do
    it { should belong_to(:studio) } 
  end
end
  