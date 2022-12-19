class MissionsController < ApplicationController
    def index
        render json: Mission.all, status: :ok
    end

    def show
        render json: Mission.find(params[:id]), status: :ok
    end

    def create
        render json: Mission.create!(mission_params).planet, status: :created
    end

    private
    def mission_params
        params.permit(:name,:scientist_id,:planet_id)
    end
end
