class AuctionsController < ApplicationController
  before_action :set_auction, only: [ :show, :update, :destroy, :create_bid ]

  # GET /auctions
  def index
    @auctions = Auction.where.not(user_id: @current_user.id).order(id: :desc)

    render json: @auctions
  end

  # GET /auctions/1
  def show
    render json: @auction
  end

  # POST /auctions
  def create
    @auction = Auction.new(auction_params)

    if @auction.save
      render json: @auction, status: :created, location: @auction
    else
      render json: @auction.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /auctions/1
  def update
    if @auction.update(auction_params)
      render json: @auction
    else
      render json: @auction.errors, status: :unprocessable_entity
    end
  end

  # DELETE /auctions/1
  def destroy
    @auction.destroy
  end

  # GET /auctions/:id/bids
  def bids
    @bids = @auction.bids.order(price: :desc)
    render json: @bids
  end

  # post /auctions/:id/bids
  def create_bid
    @bid = @auction.bids.new(bid_params)
    @bid.user = @current_user
    if @bid.save
      render json: @bid, status: :created
    else
      render json: { errors: @bid.errors.full_messages }, status: :unprocessable_entity
    end
  end

  # get /current_user_auctions
  def current_user_auctions
    @auctions = @current_user.auctions.order(created_at: :desc)
    render json: @auctions
  end

  private

  def set_auction
    @auction = Auction.find(params[:id])
  end

  def auction_params
    params.permit(:title, :description, :end_date, :starting_price).merge(user_id: @current_user.id)
  end

  def bid_params
    params.permit(:price).merge(user_id: @current_user.id)
  end
end
