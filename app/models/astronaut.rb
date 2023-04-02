class Astronaut < ApplicationRecord
  validates_presence_of :name, :age, :job
  has_many :astronaut_missions
  has_many :missions, through: :astronaut_missions

  def self.average_age
    sum = 0
    Astronaut.all.each { |astronaut| sum += astronaut.age }
    sum.fdiv(Astronaut.all.size).round(0)
  end

  def total_time_in_space
    missions.sum(:time_in_space)
  end
end
