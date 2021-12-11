# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# run task
Rake::Task['currency:update'].invoke

progress_bar = ProgressBar.create(title: "Sample conversions creating", starting_at: 0, total: 7)

7.times do
  Conversion.create(currency: Currency.all.sample, to: Currency.all.sample)

  progress_bar&.increment
end
