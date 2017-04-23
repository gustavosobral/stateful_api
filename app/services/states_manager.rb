# Service to manage the Main model states behaviour
class StatesManager
  attr_accessor :model, :params

  def initialize(model, params)
    @model  = model
    @params = params
  end

  def process
    remove_absents
    params[:states].each do |state|
      update_state(state)
    end
    model_state
    model.states.ordered
  end

  private

  def remove_absents
    states_ids = params[:states].map { |param| param[:id] }
    absents = model.states.where.not(id: states_ids)
    absents.destroy_all
  end

  def update_state(params)
    state = model.states.find_or_initialize_by(id: params[:id])
    state.name  = params[:name]
    state.order = params[:order]
    state.save
  end

  def model_state
    model.current_state = nil if model.states.empty?
    model.current_state = 0 unless model.states.empty? || model.current_state
    model.save
  end
end
