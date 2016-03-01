require 'rails_helper'

RSpec.describe Vote, type: :model do
  let(:vote) {FactoryGirl.build_stubbed(:vote)}

  it 'has a valid factory' do
    expect(vote).to be_valid
  end
end
