class Character < ApplicationRecord
  belongs_to :user
  has_many :characteristics, dependent: :destroy
  has_many :skills, dependent: :destroy
  has_many :obligations, dependent: :destroy
  has_many :critical_injuries, dependent: :destroy
  has_many :equipment_logs, dependent: :destroy
  has_many :motivations, dependent: :destroy
  has_many :talents, dependent: :destroy
  has_many :weapons, dependent: :destroy

  validates_presence_of :user_id
  validates_presence_of :name
  validates_presence_of :species
  validates_presence_of :specialization
  validates_presence_of :career
  validates_presence_of :age
  validates_presence_of :height
  validates_presence_of :build
  validates_presence_of :hair
  validates_presence_of :eyes
end
