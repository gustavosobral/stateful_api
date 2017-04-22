module V1
  # Main models API endpoints
  class ModelsController < ApplicationController
    before_action :authenticate_user!
    before_action :verify_admin!, except: [:index, :show]

    def index
      models = Model.all
      render json: models
    end

    def create
      model = Model.new(model_params)
      if model.save
        render json: model
      else
        render json: { errors: model.errors }, status: :bad_request
      end
    end

    def show
      model = set_model
      render json: model
    end

    def update
      model = set_model
      if model.update(model_params)
        render json: model
      else
        render json: { errors: model.errors }, status: :bad_request
      end
    end

    def destroy
      model = set_model
      model.destroy
    end

    private

    def set_model
      Model.find(params[:id])
    end

    def model_params
      params.require(:model).permit(:name, :current_state)
    end
  end
end
