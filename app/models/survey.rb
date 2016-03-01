class Survey < ActiveRecord::Base
  has_many :questions, dependent: :destroy

  enum status: [ :open, :closed ]

  def valid_emails(emails)
    emails.select {|email| !!(email =~ /@/)}
  end

  def summary
    h = Hash.new
    questions.each do |q|
      h[q.title] = q.votes_summary
    end
    h
  end
end
