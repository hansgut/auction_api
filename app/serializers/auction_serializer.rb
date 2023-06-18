class AuctionSerializer < ActiveModel::Serializer
  attributes :id, :title, :description, :end_date, :starting_price, :current_price, :bids
  belongs_to :user

  def bids
    object.bids.order(id: :desc).map { |bid| BidSerializer.new(bid) }
  end
end
