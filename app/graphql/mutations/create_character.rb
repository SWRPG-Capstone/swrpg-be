class Mutation::CreateCharacter < Mutations::BaseMutation
  argument :name, String, required: true
  argument :species, String, required: true
  argument :specialization, String, required: true
  argument :career, String, required: true
  argument :age, Integer, required: true
  argument :height, String, required: true
  argument :build, String, required: true
  argument :hair, String, required: true
  argument :eyes, String, required: true

  def resolve(name:, species:, specialization:, career:, age:, height:, build:, hair:, eyes:)
    character = Character.new(name: name, species: species, specialization: specialization, career: career, age: age, height: height, build: build, hair: hair, eyes: eyes)

    if character.save
      {
        character: charater,
        errors: []
      }
    else
      {
        character: nil,
        errors: [charater.errors.full_messages]
      }
    end
  end
end
