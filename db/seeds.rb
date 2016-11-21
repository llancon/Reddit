# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
100.times do
	user = User.create!(
		username: Faker::Internet.user_name,
		email_address: Faker::Internet.free_email,
		password: "123"

	)
end

100.times do
  link = Link.create!(
    title: Faker::Internet.url,
    description: Faker::StarWars.quote,
		user: User.all.sample
  )
end
