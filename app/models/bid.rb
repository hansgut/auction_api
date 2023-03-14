class Bid < ApplicationRecord
  belongs_to :auction
  belongs_to :user

  validates :price, presence: true, numericality: { greater_than: 0 }
  validates :auction, presence: true
  validate :validate_higher_bid
  # validate :validate_biding_user
  validate :validate_auction_time

  private

  def validate_higher_bid
    if price > auction.starting_price
      last_bid = auction.bids.order(price: :desc).first
      if last_bid.present? && price <= last_bid.price
        errors.add(:price, "must be higher than the current highest bid")
      end
    else
      errors.add(:price, "must be higher than the current starting price")
    end
  end

  def validate_biding_user
    errors.add(:user, ": you can't bid for your own auction") if auction.user_id == user_id
  end

  def validate_auction_time
    if auction.end_time <= Time.zone.now
      errors.add(:auction, "time to biding is over")
    end
  end
end
