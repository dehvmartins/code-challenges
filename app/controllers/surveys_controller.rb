class SurveysController < ApplicationController
  before_action :authenticate, only: [:respond]
  before_action :set_survey, only: [:send_email, :show, :respond, :new_send]

  def index
    @surveys = Survey.all
  end

  def show
    @questions = @survey.questions
  end

  def respond
    @token = params[:token]
    @questions = @survey.questions
  end

  def new_send
  end

  def send_email
    if params[:emails].present?
      @emails = @survey.valid_emails(params[:emails].split(" "))
      SurveyMailerJob.perform_async(@survey, @emails)
      redirect_to surveys_path, alert: "Pesquisa enviada!"
    else
      redirect_to new_send_survey_path(@survey), alert: "Preencha com algum email!"
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_survey
      @survey = Survey.find(params[:id])
    end
end
