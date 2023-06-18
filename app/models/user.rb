class User < ApplicationRecord
  require 'securerandom'

  has_many :auctions, dependent: :destroy
  has_many :bids

  has_secure_password

  validates :email, presence: true, uniqueness: true
  # validates :password, presence: true
  validates :username, presence: true, uniqueness: true

end
