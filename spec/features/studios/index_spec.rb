require 'rails_helper'

RSpec.describe 'As a visior', type: :feature do
  describe 'WHen I visit the index page' do
   
    it 'I see a list of all studios and each movie under the studio' do
      warner = Studio.create!(name:'Warner Brothers', location:'California')
      mgm = Studio.create!(name:'MGM', location:'California')

      batman = Movie.create!(title:"Batman", creation_year:'2007', genre: "superhero", studio_id: warner.id)
      thor = Movie.create!(title:"Thor", creation_year:'2008', genre: "superhero", studio_id: warner.id)
      badman = Movie.create!(title:"Generic Superhero", creation_year:'2008', genre: "still bad", studio_id: mgm.id)

      visit "/studios"

      expect(page).to have_content(warner.name)
      expect(page).to have_content(mgm.name)
      expect(page).to have_content(batman.name)
      expect(page).to have_content(badman.name)
      expect(page).to have_content(thor.name)
    end
  end
end