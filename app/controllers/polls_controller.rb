class PollsController < ApplicationController
  before_action :set_poll, only: [:show, :update, :destroy]

  def index
    @polls = Poll.all.paginate(page: params[:page], per_page: params[:per_page] || 10)
    json_response(@polls)
  end

  def show
    json_response(@poll)
  end

  def create
    @poll = Poll.create(poll_params)
    json_response(@poll, :created)
  end

  def update
    @poll.update(poll_params)
    json_response(@poll.reload)
  end

  def destroy
    @poll.delete
    @polls = Poll.all.paginate(page: params[:page], per_page: params[:per_page] || 10)
    json_response(@polls)
  end

  private

  def set_poll
    @poll = Poll.find(params[:id])
  end

  def poll_params
    params.require(:poll).permit(:title, :question)
  end
end
