class PostingsController < ApplicationController

  def index
    # @postings = Posting.all.reverse_order
    @postings = Candidate.where('status > ?', 0).reverse_order

    respond_to do |format|
      format.html
      format.json { render json: @postings }
    end
  end


  def show
    @posting = Posting.find(params[:id])

    respond_to do |format|
      format.html
      format.json { render json: @posting }
    end
  end


  def new
    @posting = Posting.new
    @candiates=current_user.candidates
  end


  def create
    # @candidate = Candidate.find(params[:candidate_id])
    # @new_posting = Posting.new()
    # @new_posting.candidate_id = @candidate.id

    if current_user.candidate.posting.present?

      @candidate = Candidate.find(params[:candidate_id])
      # @new_posting = Posting.new()
      # @new_posting.candidate_id = @candidate.id
      @candidate.status = 1
      @candidate.save

      respond_to do |format|
        if @candidate.save
          format.html { redirect_to candidate_path id: @candidate.id }
          format.json { render :show, status: :ok, location: @candidate }
        else
          format.html { render :new }
          format.json { render json: @new_posting.errors, status: :unprocessable_entity }
        end
        end

  else

    @candidate = Candidate.find(params[:candidate_id])
    @new_posting = Posting.new()
    @new_posting.candidate_id = @candidate.id
    @new_posting.save
    @candidate.status = 1
    @candidate.save
    @new_posting.errors.full_messages

    respond_to do |format|
      if @new_posting.save
        format.html { redirect_to candidate_path id: @candidate.id }
        format.json { render :show, status: :ok, location: @new_posting }
      else
        format.html { render :new }
        format.json { render json: @new_posting.errors, status: :unprocessable_entity }
      end
    end
    end
  end


  def destroy
    @candidate = Candidate.find(params[:id])
    # @posting= Posting.find(params[:candidate_id])
    # @posting = Posting.find(params[:id])
    # @posting.candidate_id = @candidate.id

    @candidate.status = 0
    @candidate.save
    # @posting.destroy
    respond_to do |format|
      format.html { redirect_to candidate_path, notice: 'You have successfully removed your posting' }
      format.json { head :no_content }
    end
  end

end
