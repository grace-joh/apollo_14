# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
@astronaut1 = Astronaut.create!(name: 'John Doe', age: 31, job: 'Pilot')
@astronaut2 = Astronaut.create!(name: 'John Smith', age: 29, job: 'Engineer')
@astronaut3 = Astronaut.create!(name: 'John McAdams', age: 37, job: 'Researcher')