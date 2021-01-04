require 'rails_helper'

RSpec.describe Actor, type: :model do
  describe "validations" do
    it { should validate_presence_of :name}
    it { should validate_presence_of :age}
    
  describe 'relationships' do
    it { should have_many :movie_actors}
    it { should have_many(:movies).through(:movie_actors)}
    end

  describe 'class methods' do 
    it "should average age" do
    bale = Actor.create!(name:"Christian Bale", age: 44)
    man = Actor.create!(name:"genericman!", age: 26)

    expect(Actor.average_age).to eq(35)
    end
  end
end
end
