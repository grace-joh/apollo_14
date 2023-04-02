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
end
