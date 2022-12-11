module Mutations 
  module Users 
    class CreateUser < ::Mutations::BaseMutation
      argument :username, String, required: true
      argument :password, String, required: true
      argument :password_confirmation, String, required: true

      field :user, Types::UserType, null: false
      field :errors, [String], null:false

      def resolve(username:, password:, password_confirmation:)
        user = User.create(username: username, password: password, password_confirmation: password_confirmation)

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
  end
end

