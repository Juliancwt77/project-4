class CandidatesController < ApplicationController

  def index
    @candidates=Candidate.all

    respond_to do |format|
      format.html
      format.json { render json: @candidates }
    current_user
    end
  end

  def show
    @posting = Candidate.find(params[:id])
  end

  def create
      current_user
      @new_candidate = Candidate.new()
      @new_candidate.title = params[:candidate][:title]
      @new_candidate.language = params[:candidate][:language]
      @new_candidate.description = params[:candidate[:description]
      @new_candidate.rate = params[:candidate][:rate]
      @new_candidate.status = params[:candidate][:status]
      @new_candidate.photo = params[:candidate][:photo]

      respond_to do |format|
        if @new_candidate.save
          format.html { redirect_to myproperties_path, notice: 'Your property is successfully created.' }
          format.json { render :show, status: :ok, location: @new_candidate }
        else
          format.html { render :new }
          format.json { render json: @new_candidate.errors, status: :unprocessable_entity }
        end
      end
  end






end
