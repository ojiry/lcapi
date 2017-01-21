# frozen_string_literal: true
class EventsController < ApplicationController
  before_action :set_event, only: %i(show update destroy)
  before_action :set_user, only: :create

  def index
    @events = Event.all

    render json: @events
  end

  def show
    render json: @event
  end

  def create
    @event = @user.events.new(event_params)

    if @event.save
      @user.participations.create(event: @event)

      render json: @event, status: :created, location: @event
    else
      render json: @event.errors, status: :unprocessable_entity
    end
  end

  def update
    if @event.update(event_params)
      render json: @event
    else
      render json: @event.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @event.destroy
  end

  private
    def set_event
      @event = Event.find(params[:id])
    end

    def set_user
      @user = User.find_by!(username: params[:username])
    end

    def event_params
      params.permit(:name, :scheduled_at, :place)
    end
end
