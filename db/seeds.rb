# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

user_1 = User.create!(:role => 'member', :email => 'nick@gmail.com', :password => 'topsecret', :password_confirmation => 'topsecret')
user_2 = User.create!(:role => 'member', :email => 'brianna@gmail.com', :password => 'topsecret', :password_confirmation => 'topsecret')
user_3 = User.create!(:role => 'member', :email => 'amylynn@gmail.com', :password => 'topsecret', :password_confirmation => 'topsecret')
admin = User.create!(:role => 'admin', :email => 'ateam@gmail.com', :password => 'topsecret', :password_confirmation => 'topsecret')

spots = [
  { name: 'Little Ducklings',location:'Boston Common, Boston MA',description: 'all the ducks', photo: 'https://cdn1.sph.harvard.edu/wp-content/uploads/sites/48/2012/09/make-way-for-ducklings-5.jpg', user: user_1},
  { name: 'Abe Blinkin',location:'1 Cambridge Sq, Cambridge MA',description: 'abe is the man', photo: 'http://www.talkingstatues.co.uk/stockist_images/chicagoadmin/530x1530_lincoln.jpg', user: user_1 },
  { name: 'George Washington',location:'1 Cambridge Sq, Cambridge MA',description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum', photo: 'https://upload.wikimedia.org/wikipedia/commons/9/92/George_Washington_statue_in_the_Boston_Public_Garden_-_DSC08201.JPG', user: user_2 },
  { name: 'Sam Adams',location:'Boston Common, Boston MA',description: 'great beer', user: user_2 },
  { name: 'Lorem ipsum',location:'1 Cambridge Sq, Cambridge MA',description: 'abe is the man', photo: 'https://cdn-www.enfocus.com/sites/combell-www.enfocus.com/files/media/blog/2017-08-09-Lorem-Ipsum/lorem-ipsum.jpg', user: user_3 },
  { name: 'Christian the Pirate',location:'Deck 7 Common, Boston MA',description: 'fastest eyes', user: user_3 },
  { name: 'Evan the Great',location:'1 Cambridge Sq, Cambridge MA',description: 'lorem ipsum dolum', user: user_3 },
  { name: 'Content from admin',location:'1 Cambridge Sq, Cambridge MA',description: 'lorem ipsum dolum', user: admin },
]

spots.each do |item|
  spot = Spot.create!(item)
end

user_1 = User.last
spot_1 = Spot.last

Review.create!(description: "Some amazing place!", rating: 5, spot: spot_1, user: user_1)
