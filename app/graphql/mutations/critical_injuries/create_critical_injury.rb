module Mutations
  module CriticalInjuries
    class CreateCriticalInjury < ::Mutations::BaseMutation
      argument :character_id, Integer, required: true 
      argument :severity, Integer, required: true 
      argument :result, String, required: true 
      type Types::CriticalInjuryType 
      field :errors, [String], null:false

      def resolve(character_id:, severity:, result:)
        crit_injury= CriticalInjury.new(character_id: character_id, severity: severity, result: result)

        if crit_injury.save
          crit_injury
        else
          {
            critical_injury: nil,
            errors: [crit_injury.errors.full_messages]
          }
        end
      end
    end
  end
end
