class AuctionsController < ApplicationController
    before_action :authenticate_user!, only: [:create]
    def create
        auction = Auction.new auction_params
        auction.user = current_user
        if auction.save!
            render json: {id: auction.id}
        else
            render json: {errors: auction.errors}, status: 422
        end
    end

    def show
        auction = Auction.find params[:id]
        render json: auction
    end


    def index 
        auctions = Auction.all.order(created_at: :desc)
        render json: auctions
    end



    private 

    def auction_params 
        params.require(:auction).permit(:title, :description, :price, :reserve, :expiry_date)
    end


end