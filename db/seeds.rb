# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

categories = [
  "Frontend",
  "Backend",
  "Other"
]

tests = [
  [ "How to do frontend", 0, 1 ],
  [ "How to do frontend 2", 1, 1 ],
  [ "How to do frontend 3", 2, 1 ],
  [ "How to do Backend", 0, 2 ],
  [ "How to do Backend 2", 1, 2 ],
  [ "How to do Backend 3", 2, 2 ],
  [ "How to do Other", 0, 3 ],
  [ "How to do Other 2", 1, 3 ],
  [ "How to do Other 3", 2, 3 ]
]

users = [
  ["Griwa", "noob"]
]

results = [
  [1, 1],
  [1, 4],
  [1, 7],
  [1, 2],
  [1, 5],
  [1, 9]
]

categories.each do |cat|
  Category.create(title: cat)
end

tests.each do |t|
  Test.create(title: t[0], level: t[1], category_id: t[2])
end

users.each do |man|
  User.create(name: man[0], rang: man[1])
end

results.each do |complete|
  Result.create(users_id: complete[0], tests_id: complete[1])
end
