# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#

User.destroy_all
Spot.destroy_all
Review.destroy_all

user_1 = User.create!(:email => 'nick@gmail.com', :password => 'topsecret', :password_confirmation => 'topsecret')
user_2 = User.create!(:email => 'brianna@gmail.com', :password => 'topsecret', :password_confirmation => 'topsecret')
user_3 = User.create!(:email => 'amylynn@gmail.com', :password => 'topsecret', :password_confirmation => 'topsecret')
admin = User.create!(:email => 'ateam@gmail.com', :password => 'topsecret', :password_confirmation => 'topsecret', admin: true)

spots = [
  { name: 'All Saints Way',location:'4 Battery Street, Boston, Massachusetts, 02109', description: '"Mock all and sundry things, but leave the saints alone." While the shrine is a personal project on private property, Baldassari has been known to give quick tours, and a good portion of the collection is visible from the street, even if the gate is locked. ', remote_photo_url: 'https://s3.amazonaws.com/arts-bostonia/arts-bostonia-production/allsaints.jpeg', user: user_1 },
  { name: 'Site of this First Bell of Boston', location:'19 N Square, Boston, Massachusetts, 02113', description: 'The first bell ever cast in Boston was cast by Paul Revere...and sounded terrible.', remote_photo_url: 'https://s3.amazonaws.com/arts-bostonia/arts-bostonia-production/bostonbell.jpg', user: user_1},
  { name: 'Potato Shed Memorial',location:'Millers River Littoral Way, Boston, Massachusetts', description: 'Sacks of potatoes, made of cast stone, mark where the iconic potato sheds once stood along the river.', remote_photo_url: 'https://s3.amazonaws.com/arts-bostonia/arts-bostonia-production/potatoShedStatu.jpg', user: user_1},
  { name: 'Salada Tea Doors',location:'330 Stuart Street, Boston, Massachusetts, 02116', description: 'The history of the tea trade is told in bas-relief on this historic pair of Boston doors. These twelve-foot-tall, two-ton bronze doors were commissioned by Peter C. Larkin, founder of the Salada Tea Company, to celebrate his industry’s storied past.', remote_photo_url: 'https://s3.amazonaws.com/arts-bostonia/arts-bostonia-production/saladateadoors.jpeg', user: user_1},
  { name: 'Memorial for Boston Light Keepers',location:'49 Snow Hill St, Copp’s Hill Cemetery, Boston, Massachusetts, 02113', description: 'Tragedy on Little Brewster Island memorialized.
This triple headstone can be found near the center of the cemetery, and serves as a memorial to this strange and tragic week in Boston Light’s history.', remote_photo_url: 'https://s3.amazonaws.com/arts-bostonia/arts-bostonia-production/lightkeepermemorial.png', user: user_1},
{ name: 'Monument to Ether',location:'8 Arlington St, Boston Public Garden, MA, 02116', description: 'Statue commemorating the use of ether in anesthesia.', remote_photo_url: 'https://s3.amazonaws.com/arts-bostonia/arts-bostonia-production/EtherMonument.jpg', user: user_1 },
  { name: 'Make Way for Ducklings Statue',location:'Boston Public Garden, Charles Street, Boston, Massachusetts', description: 'Mrs. Mallard and her brood are a beloved fixture in Boston Public Garden.', remote_photo_url: 'https://s3.amazonaws.com/arts-bostonia/arts-bostonia-production/makewayducklings.jpg', user: user_1},
  { name: 'Edgar Allan Poe Square',location:'1-5 MA-28, Boston, Massachusetts, 02116', description: 'The Boston square dedicated to the dark poet who was born nearby.', remote_photo_url: 'https://s3.amazonaws.com/arts-bostonia/arts-bostonia-production/rocknakpoepfo1.jpg', user: user_1},
  { name: 'Little Ducklings',location:'Boston Common, Boston MA', description: 'all the ducks', remote_photo_url: 'https://cdn1.sph.harvard.edu/wp-content/uploads/sites/48/2012/09/make-way-for-ducklings-5.jpg', user: user_1},
  { name: 'Abe Blinkin',location:'1 Cambridge Sq, Cambridge MA', description: 'abe is the man', remote_photo_url: 'http://www.talkingstatues.co.uk/stockist_images/chicagoadmin/530x1530_lincoln.jpg', user: user_1 },
  { name: 'Content from admin',location:'1 Cambridge Sq, Cambridge MA',description: 'lorem ipsum dolum', user: admin }
]

spots.each do |item|
  spot = Spot.create!(item)
end

user_1 = User.last
spot_1 = Spot.last

Review.create!(description: "Some amazing place!", rating: 5, spot: spot_1, user: user_1)
