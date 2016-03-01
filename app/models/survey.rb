class Survey < ActiveRecord::Base
  has_many :questions, dependent: :destroy

  enum status: [ :open, :closed ]

  def valid_emails(emails)
    emails.select {|email| !!(email =~ /@/)}
  end
end
