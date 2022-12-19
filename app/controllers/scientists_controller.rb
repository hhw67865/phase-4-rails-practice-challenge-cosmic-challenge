class ScientistsController < ApplicationController

rescue_from ActiveRecord::UnknownAttributeError, with: :asd


    def index
        render json: Scientist.all, status: :ok
    end

    def show
        render json: Scientist.find(params[:id]),serializer: ScientistShowSerializer, status: :ok
    end

    def create
        render json: Scientist.create!(scientist_params), status: :created
    end

    def update
        scientist = Scientist.find(params[:id])
        scientist.update!(scientist_params)
        render json: scientist, status: :accepted
    end

    def destroy
        Scientist.find(params[:id]).destroy
        head :no_content
    end

    private

    def scientist_params
        params.permit(:name, :field_of_study, :avatar)
    end

    def asd
        render json: {error:"hehe"}
    end
    


end
