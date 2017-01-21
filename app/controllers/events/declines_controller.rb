# frozen_string_literal: true
class Events::DeclinesController < ApplicationController
  before_action :set_event, only: :destroy
  before_action :set_user, only: :destroy

  def destroy
    @participation = @user.participations.find_by(event_id: @event.id)
    @participation&.destroy
  end

  private
    def set_event
      @event = Event.enabled.find(params[:event_id])
    end

    def set_user
      @user = User.find_by!(username: params[:username])
    end
end
