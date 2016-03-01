# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
survey = Survey.create(title: "Satisfação")
options = (1..5).map { |i| Option.new(title: i.to_s)}
question = Question.create(title: "Nota de satisfação com o time",
           options: options, survey: survey)
