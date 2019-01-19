class UserPollsController < ApplicationController
  attr_reader :current_user

  before_action :authorize_request
  before_action :set_poll, only: [:show, :update, :destroy]

  def index
    @polls = current_user.polls
    json_response(@polls)
  end

  def show
    json_response(@poll)
  end

  def create
    @poll = current_user.polls.create!(user_poll_params)
    json_response(@poll, :created)
  end

  def update
    @poll.update!(user_poll_params)
    json_response(@poll.reload)
  end

  def destroy
    @poll.destroy!
    @polls = current_user.polls
    json_response(@polls)
  end

  private

  def set_poll
    @poll = current_user.polls.find(params[:id])
  end

  def user_poll_params
    params.permit(:title, :question, votes_attributes: [:name, :times])
  end

  def authorize_request
    @current_user = (AuthorizeApiRequest.new(request.headers).call)[:user]
  end
end
