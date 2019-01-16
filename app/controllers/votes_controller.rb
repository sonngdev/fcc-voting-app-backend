class VotesController < ApplicationController
  before_action :set_poll
  before_action :set_vote, only: [:update, :destroy]

  def create
    @poll.votes.create(name: params[:name])
    json_response(@poll)
  end

  def update
    @vote.update(times: @vote.times + 1)
    json_response(@poll)
  end

  def destroy
    @vote.delete
    json_response(@poll)
  end

  private

  def set_poll
    @poll = Poll.find(params[:poll_id])
  end

  def set_vote
    @vote = Vote.find(params[:id])
  end
end
