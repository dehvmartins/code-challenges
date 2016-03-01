class SurveyMailerJob < ActiveJob::Base
  include SuckerPunch::Job

  def perform(survey, emails)
    emails.each do |email|
      SurveyMailer.send_survey_email(survey, email).deliver_now
    end
  end
end
