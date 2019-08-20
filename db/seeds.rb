require 'faker'

date = Time.at(rand * Time.now.to_i)

name_pillow = ['My awesome Pillow', 'Lovely Pillow', 'Super Pillow', 'Best for a Nap!']

name_user = ['Obama', 'Angela', 'Nemo', 'Ursula', 'Megan']

description = 'I love having a nap on this beautiful pillow!'

category = ['Boyfriend-pillow', 'Donut-pillow', 'Neck-pillow',
  'Body-pillow', 'Politic-pillow']

image_pillow = ['https://i.ebayimg.com/images/g/JoMAAOSwk-9bsgKD/s-l225.jpg',
  'https://www.liiife.co/3952-large_default/boyfriend-pillow.jpg',
  'https://images-na.ssl-images-amazon.com/images/I/A10ZKfNjVZL.jpg',
  'https://oyaco.com/pub/media/catalog/product/cache/image/1000x1320/e9c3970ab036de70892d86c6d221abfe/s/b/sb-fbp.jpg',
  'https://ih1.redbubble.net/image.458516545.5370/throwpillow,small,750x1000-bg,f8f8f8.u3.jpg']

image_user = ['https://cdn-img.instyle.com/sites/default/files/images/2019/04/meghan-markle-birth-hero.jpg',
  'https://www.cdu.de/sites/default/files/styles/large/public/media/images/buvo/161201-pv-780x439.jpg?itok=_w3ES51J',
  'https://ichef.bbci.co.uk/news/660/cpsprodpb/E225/production/_93339875_obamalaughing.jpg',
  'https://images-na.ssl-images-amazon.com/images/I/41H-ZeweL0L._SY355_.jpg',
  'https://www.bambiniamilano.it/site/wp-content/uploads/2018/04/Nemo-museo-storia-naturale-bambini-milano.jpg']

content = ['nice', 'bad', 'awesome', 'ok', '10 from 10', 'awful']

Pillow.destroy_all
User.destroy_all
puts 'Oh data destroyed'

10.times do
  user = User.new(
    full_name: name_user.sample,
    photo: image_user.sample,
    email: Faker::Internet.email,
    password: '123456'
  )
  user.save!
end

10.times do
  pillow = Pillow.new(
    name: name_pillow.sample,
    description: description,
    address: Faker::Address.full_address,
    category: category.sample,
    remote_photo_url: image_pillow.sample,
    user_id: User.all.sample.id
  )
  pillow.save!
end

puts 'Oh success!'

# 10.times do
#   booking = Booking.new(
#     start_date: "#{date}",
#     end_date: "#{date}"
#   )
#   booking.save!
# end


# 10.times do
#   review = Review.new(
#     content: content.sample,
#     rating: rand(1..5)
#   )
#   review.save!
# end

