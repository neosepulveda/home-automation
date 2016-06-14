require "rails_helper"

RSpec.describe LampsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/lamps").to route_to("lamps#index")
    end

    it "routes to #new" do
      expect(:get => "/lamps/new").to route_to("lamps#new")
    end

    it "routes to #show" do
      expect(:get => "/lamps/1").to route_to("lamps#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/lamps/1/edit").to route_to("lamps#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/lamps").to route_to("lamps#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/lamps/1").to route_to("lamps#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/lamps/1").to route_to("lamps#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/lamps/1").to route_to("lamps#destroy", :id => "1")
    end

  end
end
