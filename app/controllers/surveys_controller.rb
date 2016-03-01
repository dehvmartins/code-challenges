class SurveysController < ApplicationController
  before_action :set_survey, only: [:show]

  def index
    @surveys = Survey.all
  end

  def show
    @questions = @survey.questions
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_survey
      @survey = Survey.find(params[:id])
    end
end
