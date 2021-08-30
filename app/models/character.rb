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
end
