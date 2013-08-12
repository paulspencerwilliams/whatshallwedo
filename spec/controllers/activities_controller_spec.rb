require 'spec_helper'

describe ActivitiesController do
  describe "GET random" do
    let(:random_suggestions) {double("random suggestions")}

    before (:each) do
      Activity.stub(:random).with(10).and_return(random_suggestions)
    end

    it "assigns random activities" do
      get :random
      expect(assigns(:suggestions)).to eq(random_suggestions)
    end
    it "renders the random template" do
      get :random
      expect(response).to render_template(:random)
    end
  end
end
