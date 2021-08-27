User.destroy_all

5.times do
  User.create(username: Faker::Name.name)
end
