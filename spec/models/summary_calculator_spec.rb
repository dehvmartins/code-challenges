require 'rails_helper'

RSpec.describe Question::SummaryCalculator do

  context 'votes summary' do
    it 'returns zero' do
      expect(SummaryCalculator.calculate! []).to eq 0
    end

    it 'returns average' do
      expect(SummaryCalculator.calculate! [*1..5]).to eq 3
    end
  end

end
