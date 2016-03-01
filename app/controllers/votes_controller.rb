class VotesController < ApplicationController
  before_action :authenticate, only: [:create]

  def create
    @survey = Survey.find(params[:survey][:id])
    if params[:questions] and params[:questions].any?
      params[:questions].each do |question, option|
        Vote.create(question_id: question, option_id: option)
      end
      @survey.remove_token(params[:token])
      redirect_to surveys_path, notice: 'Você votou com sucesso'
    else
      redirect_to :back, notice: 'Você deve selecionar alguma opção'
    end
  end
end
