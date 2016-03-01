class Survey < ActiveRecord::Base

  enum status: [ :open, :closed ]
end
