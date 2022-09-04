class User < ApplicationRecord
  validates :name,
            presence: true
  validates :email,
            presence: true,
            format: { with: /\A\S+@.+\.\S+\z/,
                      message: 'Please enter a correct email' }
  has_many :todo
end
