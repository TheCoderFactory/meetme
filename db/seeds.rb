# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# user1 = User.create(first_name: 'Pete', last_name: 'Argent', email: 'boss@test.com', password: '12345678')
# Profile.create(job_title: 'Boss', user_id: user1.id)

# user2 = User.create(first_name: 'Johnny', last_name: 'Smith', email: 'junior@test.com', password: '12345678')
# Profile.create(job_title: 'Junior', user_id: user2.id)

# user3 = User.create(first_name: 'Han', last_name: 'Solo', email: 'han@test.com', password: '12345678')
# Profile.create(job_title: 'Pilot', user_id: user3.id)

# user4 = User.create(first_name: 'Leia', last_name: 'Organa', email: 'leia@test.com', password: '12345678')
# Profile.create(job_title: 'Princess', user_id: user4.id)

user5 = User.create(first_name: 'Johnny', last_name: 'Appleseed', email: 'peter.argent@gmail.com', password: '12345678')
Profile.create(job_title: "apple picker", user_id: user5.id)

