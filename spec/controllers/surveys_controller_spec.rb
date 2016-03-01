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

  describe "GET show" do
    before(:each) do
      @survey = create(:survey)
      @question = create(:question, survey: @survey)
    end

    it "assigns @survey and @questions" do
      get :show, id: @survey
      expect(assigns(:survey)).to eq(@survey)
      expect(assigns(:questions)).to eq(@survey.questions)
    end

    it "renders the #show view" do
      get :show, id: @survey
      expect(response).to render_template :show
    end
  end

  describe "GET new_send" do
    it "renders the :new_send view" do
      survey = create(:survey)
      get :new_send, id: survey
      expect(response).to render_template :new_send
    end
  end

  describe "POST send_email" do
    before(:each) do
      @survey = create(:survey)
    end

    it "redirects to new_send" do
      post :send_email, id: @survey
      expect(response).to redirect_to(new_send_survey_path(@survey))
    end

    it "redirects to index" do
      email = "test@test.com"
      post :send_email, {id: @survey, emails: email}
      expect(assigns(:emails)).to eq(email.split(" "))
      expect(response).to redirect_to(surveys_path)
    end
  end
end
