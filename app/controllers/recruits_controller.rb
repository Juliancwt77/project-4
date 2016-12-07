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

      respond_to do |format|
        if @job_offer.save
          format.html { redirect_to candidate_accept_offer_path, notice: 'You have successfully submitted your offer'}
          format.json { render :show, status: :ok, location: @job_offer}
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


  def new
    @new_recruit = Recruit.new
    @posting = Posting.find(params[:posting_id])
  end


  def create
    @new_recruit = Recruit.new()
    @new_recruit.status = 0
    @new_recruit.scope = params[:recruit][:scope]
    @new_recruit.start_date = params[:recruit][:start_date]
    @new_recruit.end_date = params[:recruit][:end_date]
    @new_recruit.posting_id = params[:recruit][:posting_id]
    @new_recruit.company_id = current_user.id

    @new_recruit.save
    @new_recruit.errors.full_messages

    respond_to do |format|
      if @new_recruit.save
        format.html { redirect_to postings_path, notice: 'You have successfully submitted your offer'}
        format.json { render :show, status: :ok, location: @new_recruit }
      else
        format.html { render :new }
        format.json { render json: @new_recruit.errors, status: :unprocessable_entity }
      end
    end

  end


end
