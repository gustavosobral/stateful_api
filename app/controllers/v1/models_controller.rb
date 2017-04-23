module V1
  # Main models API endpoints
  class ModelsController < ApplicationController
    before_action :authenticate_user!
    before_action :verify_admin!, except: [:index, :show, :walk_state]

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

    def walk_state
      model = set_model
      if walk_current_state(model)
        render json: model
      else
        render json: { errors: { base: ['no more states available'] } }, status: :bad_request
      end
    end

    private

    def set_model
      Model.find(params[:id])
    end

    def model_params
      params.require(:model).permit(:name, :current_state)
    end

    def walk_current_state(model)
      last_state = model.states.maximum(:order)
      return if last_state.nil? || model.current_state >= last_state
      model.current_state += 1
      model.save
    end
  end
end
