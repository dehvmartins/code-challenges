FactoryGirl.define do
  factory :definition do
    content { 20.times.map { [*'a'..'z'].sample }.join }
    word
  end
end
