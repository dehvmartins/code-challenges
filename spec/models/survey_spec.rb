require 'rails_helper'

RSpec.describe Survey, type: :model do
  let(:survey) {FactoryGirl.build_stubbed(:survey)}

  it 'has a valid factory' do
    expect(survey).to be_valid
  end

end
