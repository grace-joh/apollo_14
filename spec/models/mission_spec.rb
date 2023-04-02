require 'rails_helper'

describe Mission, type: :model do
  describe 'Validations' do
    it { should validate_presence_of :title }
    it { should validate_presence_of :time_in_space }
  end

  describe 'Relationships' do
    it { should have_many :astronaut_missions}
    it { should have_many :astronauts}
  end

  describe 'Class Methods' do
    describe '::order_by_title' do
      it 'can average ages of all astronauts' do
        @mission1 = Mission.create!(title: 'Gemini 7', time_in_space: 70)
        @mission2 = Mission.create!(title: 'Apollo 13', time_in_space: 250)
        @mission3 = Mission.create!(title: 'Capricorn 4', time_in_space: 100)

        expect(Mission.order_by_title).to eq([@mission2, @mission3, @mission1])
      end
    end
  end
end
