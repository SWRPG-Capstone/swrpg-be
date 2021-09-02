class CreateSkills < ActiveRecord::Migration[5.2]
  def change
    create_table :skills do |t|
      t.references :character, foreign_key: true
      t.integer :astrogation
      t.integer :athletics
      t.integer :charm
      t.integer :coercion
      t.integer :computers
      t.integer :cool
      t.integer :coordination
      t.integer :deception
      t.integer :discipline
      t.integer :leadership
      t.integer :mechanics
      t.integer :negotiation
      t.integer :perception
      t.integer :piloting
      t.integer :piloting_space
      t.integer :resilience
      t.integer :skulduggery
      t.integer :stealth
      t.integer :street_wise
      t.integer :survival
      t.integer :vigilance
      t.integer :brawl
      t.integer :gunnery
      t.integer :melee
      t.integer :ranged_light
      t.integer :ranged_heavy
      t.integer :core_worlds
      t.integer :education
      t.integer :lore
      t.integer :outer_rim
      t.integer :underworld
      t.integer :xenology
      t.integer :medicine

      t.timestamps
    end
  end
end
