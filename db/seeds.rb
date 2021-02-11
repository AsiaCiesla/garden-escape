require "open-uri"

puts 'Cleaning gardens...'
Booking.delete_all
Garden.delete_all
User.delete_all

puts 'Creating users...'

mary = User.create(
  email: "mary_berry@cake.com",
  password: "mary_berry"
)

puts 'Creating gardens...'

garden_one = Garden.create(
  title: 'Country retreat with a golf course in the garden',
  description: 'This sprawling country estate is so vast that it has a private
                nine-hole golf course in the back garden – and the fairways are
                big enough to land planes on.',
  price_per_hour: 1000,
  address: 'Ashington Lodge, Colchester, UK',
  owner: mary,
)

garden_two = Garden.create(
  title: 'Discover the Devon farmhouse with an aircraft runway',
  description: 'This stunning country pile offers the perfect antidote to tiresome
                airport queues as prospective jet-setting buyers can fly direct
                from their own back garden. That’s because the back garden of this
                sprawling six-bedroom farmhouse, wedged between Exmoor and Dartmoor
                National parks, boasts its very own aircraft hangar and 300m runway.',
  price_per_hour: 2000,
  address: 'Woodscombe Farm, Devon, UK',
  owner: mary,
)

garden_three = Garden.create(
  title: 'The Garden Of Eden',
  description: 'This Gloucester property has undoubtedly one of the most stunning
                gardens we’ve ever seen – boasting a striking Far Eastern theme and
                countless features. From a koi pond and a lily pond to a knot garden,
                lawn area and even two duck ponds. This space was definitely
                a labour of love…',
  price_per_hour: 500,
  address: 'Gloucester, UK',
  owner: mary,
)

garden_one.photo.attach(io: URI.open('app/assets/images/garden_one.jpg'), filename: 'garden_one.jpg', content_type: 'image/jpg')
garden_two.photo.attach(io: URI.open('app/assets/images/garden_two.jpg'), filename: 'garden_two.jpg', content_type: 'image/jpg')
garden_three.photo.attach(io: URI.open('app/assets/images/garden_three.jpg'), filename: 'garden_three.jpg', content_type: 'image/jpg')

puts 'Finished!'
puts "Number of gardens created: #{Garden.count}"
