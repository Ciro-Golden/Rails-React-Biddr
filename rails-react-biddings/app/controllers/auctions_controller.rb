class AuctionsController < ApplicationController::API

    def create

    end


    def index 
        auctions = Auctions.all.order(created_at: desc)
        render json: auctions
    end

    def show

    end

end