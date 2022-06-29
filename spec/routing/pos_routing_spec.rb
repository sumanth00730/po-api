require "rails_helper"

RSpec.describe PosController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/pos").to route_to("pos#index")
    end

    it "routes to #show" do
      expect(get: "/pos/1").to route_to("pos#show", id: "1")
    end


    it "routes to #create" do
      expect(post: "/pos").to route_to("pos#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/pos/1").to route_to("pos#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/pos/1").to route_to("pos#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/pos/1").to route_to("pos#destroy", id: "1")
    end
  end
end
