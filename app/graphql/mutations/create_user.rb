class Mutation::CreateUser < Mutations::BaseMutation
  argument :username, String, required: true

  field :user, Types::UserType, null: false
  field :errors, [String], null:false

  def resolve(username:)
    user = User.create(username: username)

    if user.save
      {
        user: user,
        errors: []
      }
    else
      {
        user: nil,
        errors: [user.errors.full_messages]
      }
    end
  end
end
