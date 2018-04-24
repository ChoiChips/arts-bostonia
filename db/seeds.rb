# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

spots = [
  { name: 'Little Ducklings',location:'Boston Common, Boston MA',description: 'all the ducks' },
  { name: 'Abe Blinkin',location:'1 Cambridge Sq, Cambridge MA',description: 'abe is the man' },
  { name: 'Little Ducklings',location:'Boston Common, Boston MA',description: 'all the ducks' },
  { name: 'George Washington',location:'1 Cambridge Sq, Cambridge MA',description: 'george is the man' },
  { name: 'Sam Adams',location:'Boston Common, Boston MA',description: 'great beer' },
  { name: 'Lorem ipsum',location:'1 Cambridge Sq, Cambridge MA',description: 'abe is the man' },
  { name: 'Christian the Pirate',location:'Deck 7 Common, Boston MA',description: 'fastest eyes' },
  { name: 'Evan the Great',location:'1 Cambridge Sq, Cambridge MA',description: 'lorem ipsum dolum' }
]

spots.each do |item|
  spot = Spot.create(item)
end
