FactoryGirl.define do
  factory :word do
    content { 20.times.map { [*'a'..'z'].sample }.join }
  end
end
