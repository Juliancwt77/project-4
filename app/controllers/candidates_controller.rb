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
    @candidate = Candidate.find(params[:id])

  end

  def new
  @new_candidate = Candidate.new
  unless user_signed_in?
  redirect_to new_user_session_path, :alert => "Please log in to create job profile"
  end
  end

  def create
      current_user
      @new_candidate = Candidate.new()
      @new_candidate.title = params[:candidate][:title]
      @new_candidate.language = params[:candidate][:language]
      @new_candidate.description = params[:candidate][:description]
      @new_candidate.rate = params[:candidate][:rate]
      @new_candidate.status = params[:candidate][:status]
      @new_candidate.photo = params[:candidate][:photo]
      @new_candidate.candidate_id = current_user.id
      @new_candidate.errors.full_messages

      respond_to do |format|
        if @new_candidate.save
          format.html { redirect_to candidate_path id: @new_candidate.id, notice: 'Your profile is successfully created.' }
          format.json { render :show, status: :ok, location: @new_candidate }
        else
          format.html { render :new }
          format.json { render json: @new_candidate.errors, status: :unprocessable_entity }
        end
      end
  end

  # GET /properties/1/edit
def edit
  @candidate = Candidate.find(params[:id])
  if user_signed_in?
    unless current_user.id == @candidate.candidate_id
    redirect_to root_path, :alert => "You can only edit your profile"
    end
  else
    redirect_to new_user_session_path, :alert => "Please log in to edit"
  end
  rescue ActiveRecord::RecordNotFound
  redirect_to root_url, :alert => "Record not found."
end

# POST /properties
# POST /properties.json
def update
  @candidate=Candidate.find(params[:id])
  respond_to do |format|
    if @candidate.update(candidate_params)
      format.html { redirect_to candidate_path id: @candidate.id, notice: 'Your profile was successfully updated.' }
      format.json { render :show, status: :ok, location: @candidate }
    else
      format.html { render :edit }
      format.json { render json: @candidate.errors, status: :unprocessable_entity }
    end
  end
end


  private


  def candidate_params
  params.require(:candidate).permit(:title,:language, :description, :rate, :status, :photo, :candidate_id)
  end




end
