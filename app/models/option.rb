class Option < ActiveRecord::Base
  belongs_to :question
  has_many :votes, dependent: :destroy

  def value
    title.to_i
  end
end
