# frozen_string_literal: true
require 'rails_helper'

RSpec.describe "Users", type: :request do
  describe "GET /users" do
    let(:headers) do
      {
        'Authorization': "Token #{Rails.configuration.x.access_token}",
        'Content-Type': 'application/json'
      }
    end

    subject { response }

    before { get users_path, headers: headers }

    it { is_expected.to have_http_status(200) }
  end
end
