class User < ApplicationRecord
  has_many :characters, dependent: :destroy
end
