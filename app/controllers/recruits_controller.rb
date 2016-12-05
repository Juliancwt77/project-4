class RecruitsController < ApplicationController

  def job_offers_candidate
    @current_candidate_individual_info = current_user.candidate

    respond_to do |format|
      format.html
      format.json { render json: @current_candidate_individual_info }
    end
  end


  def jobs_offered_company
    @offers_sent = current_user.recruits

    respond_to do |format|
      format.html
      format.json { render json: @offers_sent }
    end
  end

end
