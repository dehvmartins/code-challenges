class Word < ActiveRecord::Base
  has_many :definitions
  
  validates :content, presence: true
end
