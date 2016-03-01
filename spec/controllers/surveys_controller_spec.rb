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

  describe "GET respond" do
    before(:each) do
      @survey = create(:survey, token: ["token"])
      @question = create(:question, survey: @survey)
    end

    context "when token is valid" do
      it "assigns @survey and @questions" do
        get :respond, {id: @survey, token: "token"}
        expect(response.status).to eq 200
        expect(assigns(:survey)).to eq(@survey)
        expect(assigns(:questions)).to eq(@survey.questions)
      end

      it "renders the #respond view" do
        get :respond, {id: @survey, token: "token"}
        expect(response).to render_template :respond
      end
    end

    context "when token is invalid" do
      it "assigns doesnt @survey and @questions" do
        get :respond, id: @survey
        expect(response.status).to eq 401
        expect(assigns(:survey)).to be_nil
        expect(assigns(:questions)).to be_nil
      end

      it "not renders the #respond view" do
        get :respond, id: @survey
        expect(response).not_to render_template :respond
      end
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
