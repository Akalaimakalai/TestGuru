categories = Category.create!([
  { title: "Frontend" },
  { title: "Backend" },
  { title: "Other" }
])

puts "Created: #{categories}"

tests = Test.create!([
  { title: "How to do frontend", level: 0, category_id: categories[0].id },
  { title: "How to do frontend 2", level: 1, category_id: categories[0].id },
  { title: "How to do frontend 3", level: 2, category_id: categories[0].id },
  { title: "How to do Backend", level: 0, category_id: categories[1].id },
  { title: "How to do Backend 2", level: 1, category_id: categories[1].id },
  { title: "How to do Backend 3", level: 2, category_id: categories[1].id },
  { title: "How to do Other", level: 0, category_id: categories[2].id },
  { title: "How to do Other 2", level: 1, category_id: categories[2].id },
  { title: "How to do Other 3", level: 2, category_id: categories[2].id }
])

puts "Created: #{tests}"

user = User.create!(name: "GrowaDK", rang: "noob")

puts "Created: #{user}"

results = Result.create!([
  { user_id: user.id, test_id: tests[0].id },
  { user_id: user.id, test_id: tests[1].id },
  { user_id: user.id, test_id: tests[4].id },
  { user_id: user.id, test_id: tests[3].id },
  { user_id: user.id, test_id: tests[7].id }
])

puts "Created: #{results}"
