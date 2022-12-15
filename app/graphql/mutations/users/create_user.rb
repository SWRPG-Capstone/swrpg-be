module Mutations 
  module Users 
    class CreateUser < ::Mutations::BaseMutation
      argument :username, String, required: true
      argument :password, String, required: true
      argument :password_confirmation, String, required: true

      type Types::UserType
      field :errors, [String], null:false

      def resolve(**attributes)
        user = User.create!(attributes)

        user.save ? user : { user: nil, errors: [user.errors.full_messages] }
      end
    end
  end
end

