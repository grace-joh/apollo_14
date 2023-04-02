require 'rails_helper'

RSpec.describe 'the Astronaut Index page' do
  before(:each) do
    @astronaut1 = Astronaut.create!(name: 'John Doe', age: 31, job: 'Pilot')
    @astronaut2 = Astronaut.create!(name: 'John Smith', age: 29, job: 'Engineer')
    @astronaut3 = Astronaut.create!(name: 'John McAdams', age: 36, job: 'Researcher')
    @mission1 = Mission.create!(title: 'Gemini 7', time_in_space: 70)
    @mission2 = Mission.create!(title: 'Apollo 13', time_in_space: 250)
    @mission3 = Mission.create!(title: 'Capricorn 4', time_in_space: 100)

    visit '/astronauts'
  end

  describe 'User Story 1' do
    it 'displays all astronauts and attributes' do
      expect(page).to have_content('Astronauts')
      expect(page).to have_content('John Doe')
      expect(page).to have_content('Age: 31')
      expect(page).to have_content('Job: Pilot')
      expect(page).to have_content('John Smith')
      expect(page).to have_content('Age: 29')
      expect(page).to have_content('Job: Engineer')
      expect(page).to have_content('John McAdams')
      expect(page).to have_content('Age: 36')
      expect(page).to have_content('Job: Researcher')
    end
  end

  describe 'User Story 2' do
    it 'displays astronauts average age' do
      expect(page).to have_content('Average Age: 32')
    end
  end

  describe 'User Story 3' do
    it 'displays all missions in alphabetical order' do
      expect(page).to have_content('Missions')
      expect('Apollo 13').to appear_before('Capricorn 4')
      expect('Capricorn 4').to appear_before('Gemini 7')
    end
  end
end
