module V1
  # States API controller
  class StatesController < ApplicationController
    before_action :authenticate_user!
    before_action :verify_admin!, only: [:update]

    def index
      states = State.where(model: params[:model_id])
      render json: states
    end

    def update
      model = set_model
      states = StatesManager.new(model, params).process
      render json: states
    end

    private

    def set_model
      Model.find(params[:model_id])
    end
  end
end
