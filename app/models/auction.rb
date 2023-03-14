class Auction < ApplicationRecord
  belongs_to :user
  has_many :bids, dependent: :destroy

  def current_price
    bids.present? ? bids.order(price: :desc).first.price : starting_price
  end
end
