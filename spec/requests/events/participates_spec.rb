# frozen_string_literal: true
require 'rails_helper'

RSpec.describe "Events::Participates", type: :request do
  describe "POST /events/:event_id/participates" do
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

    before { post event_participate_path(event), params: params, headers: headers }

    it { is_expected.to have_http_status(201) }
  end
end
