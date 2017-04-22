# Main application controller
class ApplicationController < ActionController::API
  include DeviseTokenAuth::Concerns::SetUserByToken

  rescue_from 'ActiveRecord::RecordNotFound' do |_|
    render json: { errors: { base: ['record not found'] } }, status: :bad_request
  end

  def verify_admin!
    head 401 unless current_user.admin?
  end
end
