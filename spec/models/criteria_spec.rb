require 'spec_helper'

describe Criteria do
  describe "when initialized" do
    context "with hash with weather_id" do

      it "sets weather_id attribute" do
        Criteria.new({'weather_id' => '4324'}).weather_id.should eq(4324)   
      end
    end
  end
end
