require 'spec_helper'

describe Activity do
  context "when asked for random_undone suggestions" do
    let (:matching) { double("matching")}
    let (:all_undone) { double("all undone") }

    it "returns random undone suggestions" do
      Activity.stub(:where).with({:done => false}).and_return(all_undone)
      all_undone.stub(:random).with(10).and_return(matching)
      Activity.random_undone(10).should eq(matching)
    end
  end
end
