require 'rails_helper'

RSpec.describe Definition, type: :model do
  let(:definition) { FactoryGirl.build_stubbed(:definition) }

  it 'has a valid factory' do
    expect(definition).to be_valid
  end

  it { is_expected.to respond_to(:content) }
  it { is_expected.to validate_presence_of(:content) }
  it { is_expected.to belong_to(:word) }
  it { is_expected.to have_db_index(:word_id) }

  describe "when content is not present" do
    before { definition.content = nil }
    it { is_expected.not_to be_valid }
  end

end
