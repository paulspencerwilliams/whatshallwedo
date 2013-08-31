require 'spec_helper'

describe ActivitiesController do
  describe "GET suggestions" do
    let (:all_weathers) { double("all weathers") }
    before (:each) do
      session.stub(:[])
      Weather.stub(:all).and_return(all_weathers)
    end

    context "with criteria in session" do
      let (:criteria_in_session) { double("criteria in sessions")}
      let (:matching_suggestions) { double("matching suggestions")}
      let (:matching_weather) {double("matching weather") }

      before (:each) do
        criteria_in_session.stub(:weather_id).and_return(243)
        matching_weather.stub(:undone_activities).and_return(matching_suggestions)
        Weather.stub(:find).with(243).and_return(matching_weather)
        session.stub(:[])
        session.stub(:[]).with(:criteria).and_return(criteria_in_session)
      end

      it "should assign matching suggestions" do
        get :suggestions
        expect(assigns(:suggestions)).to eq(matching_suggestions)  
      end

      it "should assign criteria from session" do
        get :suggestions
        expect(assigns(:criteria)).to eq(criteria_in_session)  
      end

      it "assigns all weathers" do
        get :suggestions
        expect(assigns(:all_weathers)).to eq(all_weathers)
      end

      it "should render suggestions template" do
        get :suggestions
        expect(response).to render_template(:suggestions)
      end
    end

    context "with no criteria in session" do
      let (:random_suggestions) { double(" suggestions")}
      let (:blank_criteria) {double("blank criteria")}

      before (:each) do
        Activity.stub(:random_undone).with(10).and_return(random_suggestions)
        session.stub(:[]).with(:criteria).and_return(nil) 
        Criteria.stub(:new).and_return(blank_criteria)
      end

      it "should assign random suggestions" do
        get :suggestions
        expect(assigns(:suggestions)).to eq(random_suggestions)  
      end

      it "should assign a blank criteria" do
        get :suggestions
        expect(assigns(:criteria)).to eq(blank_criteria)  
      end

      it "assigns all weathers" do
        get :suggestions
        expect(assigns(:all_weathers)).to eq(all_weathers)
      end

      it "should render suggestions template" do
        get :suggestions
        expect(response).to render_template(:suggestions)
      end
    end
  end

  describe "POST create" do
    let (:activity_params) {{'name' => 'a new thing to do',
      'weather_id' => '341'}}

    before (:each) do
      Activity.stub(:create)
    end

    it "creates the activity" do
      Activity.should_receive(:create).with(activity_params)
      post :create, :activity => activity_params
    end

    it "redirects to suggestions" do
      post :create, :activity => activity_params
      expect(response).to redirect_to(suggestions_activities_path)
    end

    it "flashes success" do
      post :create, :activity => activity_params
      expect(flash[:notice]).to eq("'a new thing to do' created")
    end
  end 

  describe "PATCH update" do
    let (:activity_params) {{'done' => 'true'}}
    let (:activity) { double("activity")}

    before (:each) do
      Activity.stub(:find_by_id).with('341').and_return(activity)
      activity.stub(:update_attributes)
      activity.stub(:name).and_return('a new thing to do')
    end


    it "redirects to suggestions" do
      patch :update, :id=> '341', :activity => activity_params 
      expect(response).to redirect_to(suggestions_activities_path)
    end

    it "updates the activity" do
      activity.should_receive(:update_attributes).with(activity_params)
      patch :update, :id=> '341', :activity => activity_params 
    end

    it "flashes success" do
      patch :update, :id=> '341', :activity => activity_params 
      expect(flash[:notice]).to eq("'a new thing to do' marked as done")
    end
  end

end
