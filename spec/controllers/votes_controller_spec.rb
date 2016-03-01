require 'rails_helper'

RSpec.describe VotesController, :type => :controller do

  describe "POST create" do
    before(:each) do
      @survey = create(:survey, token: ["teste"])
      @question = create(:question, survey: @survey)
      @option = create(:option, question: @question, title: "3")
    end

    context "with valid attributes" do
      it "creates a new vote" do
        expect{
          post :create, token: "teste", questions: {@question.id => @option.id}, survey: {id: @survey.id}
        }.to change(Vote,:count).by(1)
      end

      it "redirects to index" do
        post :create, token: "teste", questions: {@question.id => @option.id}, survey: {id: @survey.id}
        expect(response).to redirect_to(surveys_path)
      end
    end

    context "with invalid attributes" do
      it "does not save the new vote" do
        expect{
          post :create, survey: {id: @survey.id}
        }.to_not change(Vote,:count)
      end
    end
  end
end
