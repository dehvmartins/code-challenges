class SurveyMailer < ApplicationMailer

  def send_survey_email(survey, email)
    @survey = survey
    @token = SecureRandom.urlsafe_base64.to_s
    survey.token << @token
    survey.save!
    mail( :to => email, :subject => 'Survey' )
  end
end
