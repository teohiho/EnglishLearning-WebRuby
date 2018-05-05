# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.create!(name:  "admin",
	email: "admin@mail.com",
	password:              "admin",
	password_confirmation: "admin",
	admin: true)
User.create!(name:  "test",
	email: "test@mail.com",
	password:              "123456",
	password_confirmation: "123456")

20.times do |n|
	name  = Faker::Name.name
	email = "example-#{n+1}@mail.com"
	password = "password"
	User.create!(name:  name,
		email: email,
		password:              password,
		password_confirmation: password)

#microposts
	users = User.order(:created_at).take(6)
	50.times do
		content = Faker::Lorem.sentence(5)
		users.each { |user| user.microposts.create!(content: content) }
	end

Word.create(word: 'Dog', mean1: 'con gà', mean2: 'điện thoại', mean3: 'con voi', mean4:'máy tính', mean: 'con gà', status: 0, lesson_id: 1)
Word.create(word: 'Bird', mean1: 'con gà', mean2: 'con chim', mean3: 'con ba ba', mean4:'máy tính', mean: 'con chim', status: 0, lesson_id: 1)
Word.create(word: 'Hotel', mean1: 'khách sạn', mean2: 'biệt thự', mean3: 'căn nhà màu tím', mean4:'đồi', mean: 'khách sạn', status: 0, lesson_id: 2)
Word.create(word: 'Train', mean1: 'đi', mean2: 'di chuyển', mean3: 'con voi', mean4:'du lịch', mean: 'du lịch', status: 0, lesson_id:2)
# Vocabulary.create(word: 'Teacher', mean1: 'học sinh', mean2: 'công chức', mean3: 'bác sĩ', mean4:'cô gíao, thầy gíao', mean: 'cô gíao, thầy gíao', group_id: 1)
# Vocabulary.create(word: 'Cat', mean1: 'con mèo', mean2: 'con chó', mean3: 'bút bi', mean4:'cái bàn', mean: 'con mèo', group_id: 1)
Lesson.create(id: 1, name: "Động vật")
Lesson.create(id: 2, name: "Du lịch")

# Following relationships
users = User.all
user  = users.first
following = users[2..50]
followers = users[3..40]
following.each { |followed| user.follow(followed) }
followers.each { |follower| follower.follow(user) }
end



