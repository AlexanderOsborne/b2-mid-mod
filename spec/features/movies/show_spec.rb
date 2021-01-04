require 'rails_helper'

RSpec.describe 'As a visitor', type: :feature do
  describe 'when I visit the movie show page' do

    it 'I see the movie attribues and a list of all its actors from young to old, as well as average age' do
      warner = Studio.create!(name:'Warner Brothers', location:'California')
      batman = Movie.create!(title:"Batman", creation_year:'2007', genre: "superhero", studio_id: warner.id)
      bale = Actor.create!(name:"Christian Bale", age: 43)
      man = Actor.create!(name:"genericman!", age: 25)

      MovieActor.create!(movie_id: batman.id, actor_id: bale.id)
      MovieActor.create!(movie_id: batman.id, actor_id: man.id)
    
      visit "movies/#{batman.id}"  

      expect(page).to have_content(batman.title)
      expect(page).to have_content(batman.creation_year)
      expect(page).to have_content(batman.genre)
      expect(man.name).to appear_before(bale.name)
      expect(page).to have_content(batman.actors.average_age)
    end
  end
end