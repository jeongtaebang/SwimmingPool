# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Seed an admin user
admin_user = User.new(name:  "Swimming Pool",
             		  email: "admin@swp.com",
               	      password: "foobar",
            		  password_confirmation: "foobar",
                      admin: true)
admin_user.skip_confirmation!
admin_user.save!

# Seed lectures
lecture1 = Lecture.new(subject: "SWP 101",
					   teacher: "Coy",
					   content: "Lorem ipsum text hello world this is swimming pool",
					   timeinfo: "2020-08-28 오후 7시")
lecture1.save!

lecture2 = Lecture.new(subject: "SWP 102",
					   teacher: "Coy",
					   content: "Lorem ipsum text hello world this is swimming pool",
					   timeinfo: "2020-08-29 오후 7시")
lecture2.save!

lecture3 = Lecture.new(subject: "SWP 103",
					   teacher: "Coy",
					   content: "Lorem ipsum text hello world this is swimming pool",
					   timeinfo: "2020-08-30 오후 7시")
lecture3.save!

lecture4 = Lecture.new(subject: "SWP 104",
					   teacher: "Coy",
					   content: "Lorem ipsum text hello world this is swimming pool",
					   timeinfo: "2020-08-31 오후 7시")
lecture4.save!