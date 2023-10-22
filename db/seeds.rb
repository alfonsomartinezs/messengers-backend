# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

default_character_aspect_types = [
  {
    name: 'High Concept',
    description: 'Your high concept is a phrase that sums up what your character is about — who they are and what they do.'
  },
  {
    name: 'Trouble',
    description: "A personal struggle or problematic relationship that complicates your character's life."
  },
  {
    name: 'Flaw',
    description: "A personal struggle that complicates your character's life."
  },
  {
    name: 'Belief',
    description: 'A principle or truth about the world that gives your character purpose and strength.'
  },
  {
    name: 'Price',
    description: 'The minimum it would take for your character to break and do whatever they are asked when pressured.'
  }
]

AspectType.destroy_all

default_character_aspect_types.each do |data|
  AspectType.create(data)
end
