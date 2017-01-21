require 'rails_helper'

RSpec.describe "Events", type: :request do
  describe "GET /events" do
    let(:headers) {
      {
        'Authorization': "Token #{Rails.configuration.x.access_token}",
        'Content-Type': 'application/json'
      }
    }

    subject { response }

    before { get events_path, headers: headers }

    it { is_expected.to have_http_status(200) }
  end
end
