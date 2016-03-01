class Survey < ActiveRecord::Base
  has_many :questions, dependent: :destroy

  enum status: [ :open, :closed ]
end
