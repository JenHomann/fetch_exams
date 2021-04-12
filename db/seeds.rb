# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

unless (user = User.first)
  user = User.create!(first_name: "Shooter", last_name: "McGavin", phone_number: "1234567890")
end

unless (college = College.first)
  college = College.create!
end

unless (exam = Exam.first)
  exam = Exam.create!(college: college, start_time: 1.day.from_now, end_time: 2.days.from_now)
  Exam.create!(college: college, start_time: 2.days.from_now, end_time: 3.days.from_now)
end

unless ExamUser.any?
  ExamUser.create!(exam: exam, user: user)
end
