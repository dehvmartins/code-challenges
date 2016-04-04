require 'rails_helper'

RSpec.describe Search, type: :model do
  let(:definition) { FactoryGirl.build_stubbed(:definition) }

  describe "#definitions" do

    it "returns definitions from database when word already exists" do
      content = definition.content
      word = definition.word.content
      expect(Search).to receive(:definitions_from_database).and_return([content])
      expect(Search.definitions(word)).to eq([content])
    end

    it "returns definitions from API when word dont exist" do
      content = definition.content
      word = 10.times.map { [*'a'..'z'].sample }.join
      expect(Search).to receive(:definitions_from_api).and_return([content])
      expect(Search.definitions(word)).to eq([content])
    end
  end

end
