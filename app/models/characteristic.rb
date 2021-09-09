class Characteristic < ApplicationRecord
  belongs_to :character

  validates_presence_of :agility
  validates_presence_of :brawn
  validates_presence_of :character_id
  validates_presence_of :char_presence
  validates_presence_of :cunning
  validates_presence_of :intellect
  validates_presence_of :willpower
end
