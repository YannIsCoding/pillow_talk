require 'faker'

date = Time.at(rand * Time.now.to_i)

name_pillow = ['My awesome Pillow', 'Lovely Pillow', 'Super Pillow', 'Best for a Nap!']

name_user = ['Obama', 'Angela', 'Nemo', 'Ursula', 'Megan', 'Jesus', 'Andy', 'Dimitri', 'Alan', 'Ryan', 'Anthony', 'Sarah', 'Rich']

description = 'I love having a nap on this beautiful pillow!'

category = ['Boyfriend-pillow', 'Donut-pillow', 'Neck-pillow',
  'Body-pillow', 'Politic-pillow']

image_pillow = ['https://i.ebayimg.com/images/g/JoMAAOSwk-9bsgKD/s-l225.jpg',
  'https://www.liiife.co/3952-large_default/boyfriend-pillow.jpg',
  'https://images-na.ssl-images-amazon.com/images/I/A10ZKfNjVZL.jpg',
  'https://images-na.ssl-images-amazon.com/images/I/61T3YtLoYFL._SX522_.jpg',
  'https://i.etsystatic.com/8641628/r/il/1ea9d0/1612533938/il_794xN.1612533938_f2uk.jpg',
  'https://res.cloudinary.com/teepublic/image/private/s--45UEtgYV--/c_crop,x_10,y_10/c_fit,w_1577/c_crop,g_north_west,h_1051,w_1051,x_263,y_-22/l_upload:v1507037314:production:blanks:gbajnunp66ec7xftnpq1/fl_layer_apply,g_north_west,x_-105,y_-121/b_rgb:ffffff/c_limit,f_jpg,h_630,q_90,w_630/v1548433334/production/designs/4078805_0.jpg',
  'https://images-na.ssl-images-amazon.com/images/I/41UouU2LQiL._SX425_.jpg',
  'https://www.mikamax.nl/wp-content/uploads/2016/08/girlfriend-pillow-1.jpg',
  'https://rebecca-page.com/wp-content/uploads/2019/02/Jess-Mullens-Unicorn-Pillow-6-600x684.jpg',
  'https://i.etsystatic.com/5676665/r/il/c1379d/997702407/il_794xN.997702407_5usz.jpg',
  'https://www.waycoolgadgets.com/wp-content/uploads/2015/12/pepperoni-pizza-pillow.jpg',
  'https://ae01.alicdn.com/kf/HTB13ibTPFXXXXaDXVXXq6xXFXXXX/Colourful-Cushion-Cover-Lovely-Parrot-Pillow-Covers-Migratory-bird-Pillow-Case-Cotton-linen-square-Throw-pillow.jpg_640x640.jpg',
  'https://www.awmok.com/wp-content/uploads/2011/06/Screen-shot-2011-06-06-at-10.18.34-AM.png',
  'https://oyaco.com/pub/media/catalog/product/cache/image/1000x1320/e9c3970ab036de70892d86c6d221abfe/s/b/sb-fbp.jpg',
  'https://ih1.redbubble.net/image.458516545.5370/throwpillow,small,750x1000-bg,f8f8f8.u3.jpg']

image_user = ['https://cdn-img.instyle.com/sites/default/files/images/2019/04/meghan-markle-birth-hero.jpg',
  'https://www.cdu.de/sites/default/files/styles/large/public/media/images/buvo/161201-pv-780x439.jpg?itok=_w3ES51J',
  'https://ichef.bbci.co.uk/news/660/cpsprodpb/E225/production/_93339875_obamalaughing.jpg',
  'https://images-na.ssl-images-amazon.com/images/I/41H-ZeweL0L._SY355_.jpg',
  'https://www.bambiniamilano.it/site/wp-content/uploads/2018/04/Nemo-museo-storia-naturale-bambini-milano.jpg']

content = ['nice', 'bad', 'awesome', 'ok', '10 from 10', 'awful', 'Whaou, just Whaou!', 'I feel like my life has a meaning now',
'I can not remember what life was like before this pillow', 'Better than my boyfriend, never talk back and always ready for cuddle']

Review.destroy_all
Pillow.destroy_all
Booking.destroy_all
User.destroy_all
puts 'Oh data destroyed'

name_user.each do |u|
  user = User.new(
    full_name: u,
    photo: image_user.sample,
    email: Faker::Internet.email,
    password: '123456'
  )
  user.save!
end

image_pillow.each do |p|
  pillow = Pillow.new(
    name: name_pillow.sample,
    description: description,
    address: Faker::Address.full_address,
    category: category.sample,
    remote_photo_url: p,
    user_id: User.all.sample.id
  )
  pillow.save!
end

pillows = Pillow.all
users = User.all

pillows_id = []
pillows.each do |pillow|
pillows_id << pillow.id
end

users_id = []
users.each do |user|
users_id << user.id
end
10.times do
  booking = Booking.new(
    user_id: users_id.sample,
    pillow_id: pillows_id.sample,
    start_date: "#{date}",
    end_date: "#{date}",
  )
  booking.save!
end

bookings = Booking.all

bookings_id = []
bookings.each do |booking|
  bookings_id << booking.id
end

10.times do
  review = Review.new(
    content: content.sample,
    rating: rand(1..5),
    booking_id: bookings_id.sample,
  )
  review.save!
end
puts 'Oh success!'
