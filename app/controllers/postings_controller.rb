class PostingsController < ApplicationController

  def index
    @postings = Candidate.where('status > ?', 0).reverse_order
  end

  def show
    @posting = Candidate.find(params[:id])
  end

end
