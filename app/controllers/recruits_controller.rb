class RecruitsController < ApplicationController

  def job_offers_candidate
    @current_user_individual_info = current_user.candidate
    # @user_posting = current_user.cand_posting

    respond_to do |format|
      format.html
      format.json { render json: @posting }
    end
  end


  def jobs_offered_hirer
    @offers = current_user.recruits

    respond_to do |format|
      format.html
      format.json { render json: @offers }
    end
  end

end
