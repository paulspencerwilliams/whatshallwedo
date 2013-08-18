require 'spec_helper'

describe ActivitiesController do
  let(:all_weathers) {double("all weathers")}
  let(:criteria)             {double("criteria")}

  before (:each) do
    Weather.stub(:all).and_return(all_weathers)
  end

  describe "GET random" do
    let(:random_suggestions) {double("random suggestions")}

    before (:each) do
      Activity.stub(:random).with(10).and_return(random_suggestions)
      Criteria.stub(:new).and_return(criteria)
    end

    it "assigns blank criteria" do
      get :random
      expect(assigns(:criteria)).to eq(criteria)

    end

    it "assigns random activities" do
      get :random
      expect(assigns(:suggestions)).to eq(random_suggestions)
    end

    it "assigns all weathers" do
      get :random
      expect(assigns(:all_weathers)).to eq(all_weathers)
    end

    it "renders the suggestions template" do
      get :random
      expect(response).to render_template(:suggestions)
    end
  end
  describe "GET filtered" do
    let(:filtered_suggestions) {double("filtered suggestions")}
    let(:specified_weather)    {double("specified weather")}
    let(:criteria_params)      {{'weather_id' => '341'}}


    before (:each) do
      Weather.stub(:find).with(341).and_return(specified_weather)
      specified_weather.stub(:activities).and_return(filtered_suggestions)
      Criteria.stub(:new).with(criteria_params).and_return(criteria)
      criteria.stub(:weather_id).and_return(341)
    end

    it "reassigns criteria" do
      get :filtered, {'criteria' => criteria_params}
      expect(assigns(:criteria)).to eq(criteria)
    end

    it "assigns filtered activities" do
      get :filtered, {'criteria' => criteria_params}
      expect(assigns(:suggestions)).to eq(filtered_suggestions)
    end

    it "assigns all weathers" do
      get :filtered, {'criteria' => criteria_params}
      expect(assigns(:all_weathers)).to eq(all_weathers)
    end

    it "renders the suggestions template" do
      get :filtered, {'criteria' => criteria_params}
      expect(response).to render_template(:suggestions)
    end
  end
end
