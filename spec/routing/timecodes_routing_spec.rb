require "spec_helper"

describe TimecodesController do
  describe "routing" do

    it "routes to #index" do
      get("/timecodes").should route_to("timecodes#index")
    end

    it "routes to #new" do
      get("/timecodes/new").should route_to("timecodes#new")
    end

    it "routes to #show" do
      get("/timecodes/1").should route_to("timecodes#show", :id => "1")
    end

    it "routes to #edit" do
      get("/timecodes/1/edit").should route_to("timecodes#edit", :id => "1")
    end

    it "routes to #create" do
      post("/timecodes").should route_to("timecodes#create")
    end

    it "routes to #update" do
      put("/timecodes/1").should route_to("timecodes#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/timecodes/1").should route_to("timecodes#destroy", :id => "1")
    end

  end
end
