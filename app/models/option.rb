class Option < ActiveRecord::Base
  belongs_to :question

  def value
    title.to_i
  end
end
