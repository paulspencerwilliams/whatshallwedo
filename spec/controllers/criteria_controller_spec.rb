require 'spec_helper'

describe CriteriaController do
  let(:criteria)  {double("criteria")}
  let(:criteria_params) {{'weather_id' => '234'}}

  before (:each) do
    Criteria.stub(:new).with(criteria_params).and_return(criteria)
  end

  describe "PUT update" do
    it "should save criteria to sesion" do
      put :update, :criteria => criteria_params
      expect(session[:criteria]).to eq(criteria)
    end

    it "should redirect to suggestions" do
      put :update, :criteria => criteria_params
      expect(response).to redirect_to(suggestions_activities_path)
    end
  end
end
