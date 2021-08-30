class Character < ApplicationRecord
  belongs_to :user
  has_many :characteristics
  has_many :skills
  has_many :obligations
  has_many :critical_injuries
  has_many :equipment_log
  has_many :motivations
  has_many :talents
end
