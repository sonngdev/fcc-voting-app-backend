class PollsController < ApplicationController
  before_action :set_poll, only: [:show, :update, :destroy]

  def index
    @polls = Poll.all
    json_response(@polls)
  end

  def show
    json_response(@poll)
  end

  private

  def set_poll
    @poll = Poll.find(params[:id])
  end
end
