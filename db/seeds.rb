User.destroy_all

User.create(username: Faker::Name.name)
