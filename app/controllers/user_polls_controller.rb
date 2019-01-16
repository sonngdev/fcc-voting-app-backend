class UserPollsController < ApplicationController
  attr_reader :current_user

  before_action :authorize_request
  before_action :set_poll, only: [:show, :update, :destroy]

  def index
    @polls = current_user.polls.paginate(page: params[:page], per_page: params[:per_page] || 10)
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
    @poll.update(user_poll_params)
    json_response(@poll.reload)
  end

  def destroy
    @poll.delete
    @polls = Poll.all.paginate(page: params[:page], per_page: params[:per_page] || 10)
    json_response(@polls)
  end

  private

  def set_poll
    @poll = current_user.polls.find(params[:id])
  end

  def user_poll_params
    params.require(:user_poll).permit(:title, :question, votes_attributes: [:name])
  end

  def authorize_request
    @current_user = (AuthorizeApiRequest.new(request.headers).call)[:user]
  end
end
