class VotesController < ApplicationController
  before_action :set_poll
  before_action :set_vote, only: [:update, :destroy]
  after_action :respond_with_poll

  def create
    Vote.create(
      poll_id: params[:poll_id],
      name: params[:name],
      times: 1
    )
  end

  def update
    @vote.update(times: @vote.times + 1)
  end

  def destroy
    @vote.delete
  end

  private

  def set_poll
    @poll = Poll.find(params[:poll_id])
  end

  def set_vote
    @vote = Vote.find(params[:id])
  end

  def response_with_poll
    json_response(@poll)
  end
end
