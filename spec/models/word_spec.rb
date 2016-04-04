require 'rails_helper'

RSpec.describe Word, type: :model do
  let(:word) { FactoryGirl.build_stubbed(:word) }

  it 'has a valid factory' do
    expect(word).to be_valid
  end

  it { is_expected.to respond_to(:content) }
  it { is_expected.to validate_presence_of(:content) }
  it { is_expected.to have_many(:definitions) }

  describe "when content is not present" do
    before { word.content = nil }
    it { is_expected.not_to be_valid }
  end

end
