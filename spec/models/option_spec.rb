require 'rails_helper'

RSpec.describe Option, type: :model do
  let(:option) {FactoryGirl.build_stubbed(:option)}

  it 'has a valid factory' do
    expect(option).to be_valid
  end

  it 'returns real value' do
    expect(build(:option, title: "1").value).to eq(1)
  end
end
