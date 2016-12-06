class RecruitsController < ApplicationController

  def job_offers_candidate
    @current_candidate_individual_info = current_user.candidate

    respond_to do |format|
      format.html
      format.json { render json: @current_candidate_individual_info }
    end


  end

  def candidate_accept_offer

    @job_offer = Recruits.find(params[:id])
      @job_offer.status = 2
      @job_offer.save
      # redirect_to job_offers_candidate_path

      respond_to do |format|
        if @job_offer.save
          format.html { redirect_to job_offers_candidate_path }
          format.json { render :show, status: :ok, location: @job_offer }
        else
          format.html { render :new }
          format.json { render json: @job_offer.errors, status: :unprocessable_entity }
        end
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
