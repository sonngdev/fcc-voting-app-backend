class VotesController < ApplicationController
  before_action :set_poll
  before_action :set_vote, only: [:update]

  def create
    @poll.votes.create!(vote_params)
    json_response(@poll)
  end

  def update
    @vote.update!(times: @vote.times + 1)
    json_response(@poll)
  end

  private

  def vote_params
    params.require(:vote).permit(:name)
  end

  def set_poll
    @poll = Poll.find(params[:poll_id])
  end

  def set_vote
    @vote = Vote.find(params[:id])
  end
end
