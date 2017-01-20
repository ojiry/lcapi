class Events::ParticipatesController < ApplicationController
  before_action :set_event, only: :create
  before_action :set_user, only: :create

  def create
    @participation = @user.participations.new(event: @event)

    if @participation.save
      render json: @participation, status: :created
    else
      render json: @participation.errors, status: :unprocessable_entity
    end
  end

  private
    def set_event
      @event = Event.find(params[:event_id])
    end

    def set_user
      @user = User.find_by!(username: params[:username])
    end
end
