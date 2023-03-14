class Auction < ApplicationRecord
  belongs_to :user
  has_many :bids, dependent: :destroy

  validates :title, presence: true
  validates :description, presence: true
  validates :starting_price, presence: true, numericality: { greater_than: 0 }
  validates :end_date, presence: true
  validate :validate_end_date

  def current_price
    bids.present? ? bids.order(price: :desc).first.price : starting_price
  end

  private

  def validate_end_date
    if end_date <= Time.zone.now
      errors.add(end_date: "must be greater than now")
    end
  end
end
