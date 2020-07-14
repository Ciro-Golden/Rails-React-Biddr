class BiddingsController < ApplicationController
    before_action :authenticate_user!, only: [:create]
    def index
        @biddings = Bidding.all
        render json: @biddings
    end

    def create
        bidding = Bidding.new bidding_params
        bidding.user = current_user
        bidding.auction = Auction.find params[:auction_id]
        if bidding.save!
            render json: {id: bidding.id}
        else
            render json: {errors: bidding.errors}, status: 422
        end
      end


      private

      def bidding_params 
        params.require(:bidding).permit(:price)
      end
    end