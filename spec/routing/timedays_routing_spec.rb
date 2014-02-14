require "spec_helper"

describe TimedaysController do
  describe "routing" do

    it "routes to #index" do
      get("/timedays").should route_to("timedays#index")
    end

    it "routes to #new" do
      get("/timedays/new").should route_to("timedays#new")
    end

    it "routes to #show" do
      get("/timedays/1").should route_to("timedays#show", :id => "1")
    end

    it "routes to #edit" do
      get("/timedays/1/edit").should route_to("timedays#edit", :id => "1")
    end

    it "routes to #create" do
      post("/timedays").should route_to("timedays#create")
    end

    it "routes to #update" do
      put("/timedays/1").should route_to("timedays#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/timedays/1").should route_to("timedays#destroy", :id => "1")
    end

  end
end
