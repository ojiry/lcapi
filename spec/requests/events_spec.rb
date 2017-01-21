# frozen_string_literal: true
require 'rails_helper'

RSpec.describe "Events", type: :request do
  let(:headers) do
    {
      'Authorization': "Token #{Rails.configuration.x.access_token}",
      'Content-Type': 'application/json'
    }
  end

  subject { response }

  describe "GET /events" do
    before { get events_path, headers: headers }

    it { is_expected.to have_http_status(200) }
  end

  describe "POST /events" do
    let(:user) { User.create email: "testuser@example.com", username: "testuser" }

    let(:params) do
      {
        name: "testevent",
        scheduled_at: Time.current,
        username: user.username
      }.to_json
    end

    before { post events_path, params: params, headers: headers }

    it { is_expected.to have_http_status(201) }
  end
end
