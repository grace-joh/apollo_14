require 'rails_helper'

describe Astronaut, type: :model do
  describe 'Validations' do
    it { should validate_presence_of :name }
    it { should validate_presence_of :age }
    it { should validate_presence_of :job }
  end

  describe 'Relationships' do
    it { should have_many :astronaut_missions}
    it { should have_many :missions}
  end

  describe 'Class Methods' do
    describe '::average_age' do
      it 'can average ages of all astronauts' do
        @astronaut1 = Astronaut.create!(name: 'John Doe', age: 31, job: 'Pilot')
        @astronaut2 = Astronaut.create!(name: 'John Smith', age: 29, job: 'Engineer')
        @astronaut3 = Astronaut.create!(name: 'John McAdams', age: 36, job: 'Researcher')

        expect(Astronaut.average_age).to eq(32)
      end
    end
  end

  describe 'Instance Methods' do
    before(:each) do
      @astronaut1 = Astronaut.create!(name: 'John Doe', age: 31, job: 'Pilot')
      @astronaut2 = Astronaut.create!(name: 'John Smith', age: 29, job: 'Engineer')
      @astronaut3 = Astronaut.create!(name: 'John McAdams', age: 36, job: 'Researcher')
      @mission1 = Mission.create!(title: 'Gemini 7', time_in_space: 70)
      @mission2 = Mission.create!(title: 'Apollo 13', time_in_space: 250)
      @mission3 = Mission.create!(title: 'Capricorn 4', time_in_space: 100)
      @astro_mission1 = AstronautMission.create!(astronaut: @astronaut1, mission: @mission1)
      @astro_mission2 = AstronautMission.create!(astronaut: @astronaut1, mission: @mission2)
      @astro_mission3 = AstronautMission.create!(astronaut: @astronaut2, mission: @mission1)
      @astro_mission4 = AstronautMission.create!(astronaut: @astronaut3, mission: @mission2)
      @astro_mission5 = AstronautMission.create!(astronaut: @astronaut3, mission: @mission3)
    end
    describe '::average_age' do
      it 'can average ages of all astronauts' do
        expect(@astronaut1.total_time_in_space).to eq(320)
        expect(@astronaut2.total_time_in_space).to eq(70)
        expect(@astronaut3.total_time_in_space).to eq(350)
      end
    end
  end
end
