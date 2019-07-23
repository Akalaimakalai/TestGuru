categories = Category.create!([
  { title: "Крылатые фразы" }
])

puts "Created: #{categories}"

user = User.create!([
  { name: "GrowaDK", rang: "noob" },
  { name: "Creater", rang: "author" }
])

puts "Created: #{user}"

tests = Test.create!([
  { title: "За 100", level: 0, category_id: categories[0].id, author_id: user[1].id },
  { title: "За 200", level: 0, category_id: categories[0].id, author_id: user[1].id }

])

puts "Created: #{tests}"

results = Result.create!([
  { user_id: user[0].id, test_id: tests[0].id }
])

puts "Created: #{results}"

questions = Question.create!([
  { question: 'Продолжите фразу: "Жизнь "', test_id: tests[0].id },
  { question: '"Я не боюсь того, кто издал 10000 игр я боюсь того, кто переиздал одну игру 10000 раз". О ком это?',
  test_id: tests[1].id }
])

puts "Created: #{questions}"

answers = Answer.create!([
  { body: "прекрасна.", question_id: questions[0].id },
  { body: "- театр.", question_id: questions[0].id },
  { body: "как коробка шоколадных конфет.", question_id: questions[0].id },
  { body: "за Нер'зула!", correct: true, question_id: questions[0].id },
  { body: "Тодд Говард", correct: true, question_id: questions[1].id },
  { body: "EA", correct: true, question_id: questions[1].id },
  { body: "Activision", correct: true, question_id: questions[1].id },
  { body: "Стив Джексон", correct: true, question_id: questions[1].id }
])

puts "Created: #{answers}"
