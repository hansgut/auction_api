class AuctionsController < ApplicationController
  before_action :set_auction, only: [ :show, :update, :destroy ]

  # GET /auctions
  def index
    @auctions = Auction.all

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

  private

  def set_auction
    @auction = Auction.find(params[:id])
  end

  def auction_params
    params.permit(:title, :description, :end_date, :starting_price).merge(user_id: @current_user.id)
  end
end
