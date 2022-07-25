class CampersController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response
  rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity_response



  # GET /campers
  def index
    @campers = Camper.all

    render json: @campers
  end

  # GET /campers/1
  def show
    render json: @camper, serializer: CamperActivitiesSerializer
  end

  # POST /campers
  def create
    @camper = Camper.new(camper_params)
    render json: @camper, status: :created

  end






  private
    # Use callbacks to share common setup or constraints between actions.
    def set_camper
      @camper = Camper.find(params[:id])
      render json: @camper
    end

    # Only allow a list of trusted parameters through.
    def camper_params
      params.permit(:name, :age)
    end

    def render_not_found_response
      render json: { error: "Camper not found" }, status: :not_found
    end
    
    def render_unprocessable_entity_response(invalid)
      render json: {"error": exception.record.errors.full_messages }, status: :unprocessable_entity
    end
end
