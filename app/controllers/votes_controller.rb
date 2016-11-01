class VotesController < ApplicationController

  def create
    @vote = Vote.new(vote_params)
  end


  private

  def vote_params
    params.require(:vote).permit(:title, :description)
  end
end
