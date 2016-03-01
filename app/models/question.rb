require 'question/summary_calculator'

class Question < ActiveRecord::Base
  belongs_to :survey
  has_many :options, dependent: :destroy
  has_many :votes, dependent: :destroy

  def votes_summary
    SummaryCalculator.calculate!(votes.map {|v| v.option.value})
  end

end
