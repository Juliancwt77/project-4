class PostingsController < ApplicationController

  def index
    # @postings = Candidate.where('status > ?', 0).reverse_order
    @postings = Posting.all.reverse_order

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

end
