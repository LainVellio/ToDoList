# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# db/seeds.rb
seed_file = Rails.root.join('db', 'seeds.yml')
data = YAML.load_file(seed_file).deep_symbolize_keys 
projects = data[:projects]
projects.each do |project|
  created_project = Project.create!(title: project[:title])
  created_project.todos.create!(project[:todos])
end