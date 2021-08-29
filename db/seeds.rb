User.destroy_all
Character.destroy_all

5.times do
  User.create(username: Faker::Name.name)
end

5.times do
  user = User.all.first
  user.characters.create(name: Faker::Name.name, species: Faker::Name.name, specialization: Faker::Name.name, career: Faker::Name.name, age: Faker::Number.number(digits: 2), height: Faker::Name.name, build: Faker::Name.name, hair: Faker::Name.name, eyes: Faker::Name.name)
end
