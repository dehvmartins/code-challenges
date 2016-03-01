require 'rails_helper'

RSpec.describe Survey, type: :model do
  let(:survey) {FactoryGirl.build_stubbed(:survey)}

  it 'has a valid factory' do
    expect(survey).to be_valid
  end

  context "validations" do
    it 'has valid emails' do
      emails = (1..5).map {"#{('A'..'z').to_a.shuffle[0,8].join}@#{('A'..'z').to_a.shuffle[0,8].join}"}
      expect(survey.valid_emails(emails).size).to eq(emails.size)
    end

    it 'has invalid emails' do
      emails = (1..5).map {"#{('A'..'z').to_a.shuffle[0,8].join}#{('A'..'z').to_a.shuffle[0,8].join}"}
      expect(survey.valid_emails(emails).size).to_not eq(emails.size)
    end
  end

  it 'returns empty summary' do
    expect(survey.summary).to eq({})
  end

end
