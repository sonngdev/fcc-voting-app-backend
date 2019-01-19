class UserPollsController < ApplicationController
  attr_reader :current_user

  before_action :authorize_request
  before_action :set_poll, only: [:destroy]

  def index
    @polls = current_user.polls
    json_response(@polls)
  end

  def create
    @poll = current_user.polls.create!(user_poll_params)
    json_response(@poll, :created)
  end

  def destroy
    @poll.destroy!
    head :no_content
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
