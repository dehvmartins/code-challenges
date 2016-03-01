class SummaryCalculator

  def self.calculate! scores
    new(scores).calculate
  end

  attr_reader :scores

  def initialize(scores)
    @scores = scores
  end

  def calculate
    number_of_scores > 0 ? scores.reduce(:+).to_f / number_of_scores : 0
  end

  private

  def number_of_scores
    scores.length
  end

end
