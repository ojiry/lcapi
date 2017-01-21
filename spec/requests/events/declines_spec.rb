# frozen_string_literal: true
require 'rails_helper'

RSpec.describe "Events::Declines", type: :request do
  describe "DELETE /events/:event_id/declines" do
    let(:user) { User.create email: "testuser@example.com", username: "testuser" }
    let(:event) { user.events.create name: "testevent", scheduled_at: 1.day.since }
    let(:params) { { username: user.username }.to_json }

    let(:headers) do
      {
        'Authorization': "Token #{Rails.configuration.x.access_token}",
        'Content-Type': 'application/json'
      }
    end

    subject { response }

    before { delete event_decline_path(event), params: params, headers: headers }

    it { is_expected.to have_http_status(204) }
  end
end
