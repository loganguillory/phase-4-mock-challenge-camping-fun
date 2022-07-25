class SignupsController < ApplicationController
  before_action :set_signup, only: [:show, :update, :destroy]
  rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity_response
  # GET /signups
  

  
  # POST /signups
  def create
    signup = Signup.new(signup_params)
    if @signup.save
    render json: @signup.activity, status: :created
  end

  # PATCH/PUT /signups/1
  

  

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_signup
      signup = Signup.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def signup_params
      params.permit(:camper_id, :activity_id, :time)
    end

    def render_unprocessable_entity_response(invalid)
      render json: {"error": exception.record.errors.full_messages }, status: :unprocessable_entity
    end
end

