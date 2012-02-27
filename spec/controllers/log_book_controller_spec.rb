require 'spec_helper'

describe LogBookController do
  describe "POST index" do
    it "lists all of the runs" do
      Run.should_receive(:find)
      get :index
    end
  end	
end
