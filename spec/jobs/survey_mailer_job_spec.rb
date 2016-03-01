require 'rails_helper'

RSpec.describe SurveyMailerJob, type: :job do
  describe "#perform" do
    let(:survey) { FactoryGirl.create(:survey) }

    it "delivers an email" do
      expect {
        emails = (1..2).map {"#{('A'..'z').to_a.shuffle[0,8].join}@#{('A'..'z').to_a.shuffle[0,8].join}"}
        SurveyMailerJob.new.perform(survey, emails)
      }.to change{ ActionMailer::Base.deliveries.size }.by(2)
    end
  end
end
