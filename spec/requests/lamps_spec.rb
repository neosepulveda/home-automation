require 'rails_helper'

RSpec.describe "Lamps", type: :request do
  describe "GET /lamps" do
    it "works! (now write some real specs)" do
      get lamps_path
      expect(response).to have_http_status(200)
    end
  end
end
