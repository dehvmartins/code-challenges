require 'rails_helper'

RSpec.describe Question, type: :model do
  let(:question) {FactoryGirl.build_stubbed(:question)}

  it 'has a valid factory' do
    expect(question).to be_valid
  end
end
