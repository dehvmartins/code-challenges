class SurveyMailerJob < ActiveJob::Base
  include SuckerPunch::Job

  def perform(survey, emails)
  end
end
