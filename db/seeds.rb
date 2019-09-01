categories = Category.create!([
  { title: "Крылатые фразы" }
])

puts "Created: #{categories}"

user = User.create!([
  { nickname: "GriwaDK", email: "GriwaDK@yandex.xxx", password: "qwerty",
    first_name: "Ivan", last_name: "Vvalenkah" },
  { nickname: "Creater", email: "Lord@google.com", password: "qwerty",
    first_name: "Fed'ka", last_name: "Svali", type: "Admin" }
])

puts "Created: #{user}"

tests = Test.create!([
  { title: "За 100", level: 0, category: categories[0], author: user[1] },
  { title: "За 200", level: 0, category: categories[0], author: user[1] }

])

puts "Created: #{tests}"

results = Result.create!([
  { user: user[0], test: tests[0] }
])

puts "Created: #{results}"

questions = Question.create!([
  { body: 'Продолжите фразу: "Жизнь "', test: tests[0] },
  { body: '"Я не боюсь того, кто издал 10000 игр я боюсь того, кто переиздал одну игру 10000 раз". О ком это?',
  test: tests[1] }
])

puts "Created: #{questions}"

answers = Answer.create!([
  { body: "прекрасна.", question: questions[0] },
  { body: "- театр.", question: questions[0] },
  { body: "как коробка шоколадных конфет.", question: questions[0] },
  { body: "за Нер'зула!", correct: true, question: questions[0] },
  { body: "Тодд Говард", correct: true, question: questions[1] },
  { body: "EA", correct: true, question: questions[1] },
  { body: "Activision", correct: true, question: questions[1] },
  { body: "Стив Джексон", correct: true, question: questions[1] }
])

puts "Created: #{answers}"
