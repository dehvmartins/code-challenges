require 'rails_helper'

RSpec.describe SurveysController, :type => :controller do
  describe "GET index" do
    it "assigns surveys" do
      survey = create(:survey)
      get :index
      expect(assigns(:surveys)).to eq([survey])
    end

    it "renders the :index view" do
      get :index
      expect(response).to render_template :index
    end
  end
end
