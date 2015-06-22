# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
30.times do
  u = User.new
  u.name = Faker::Name.name
  u.email = Faker::Internet.email(u.name)
  u.password = Faker::Internet.password(8)
  u.password_confirmation = u.password
  u.remote_avatar_url = Faker::Avatar.image
  u.save
end

30.times do
  t = Twixt.new
  t.user_id = Random.rand(1..User.count)
  t.content = Faker::Hacker.say_something_smart
  t.save
end
