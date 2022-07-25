class ActivitiesController < ApplicationController
  
  rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response
  # GET /activities
  def index
    activities = Activity.all
    render json: activities
  end

  # DELETE /activities/1
  def destroy
    activity = set_activity
    activity.destroy
    head :no_content
   
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_activity
    Activity.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def activity_params
      params.permit(:name, :difficulty)
    end

    def render_not_found_response
      render json: { error: "Activity not found" }, status: :not_found
    end
end
