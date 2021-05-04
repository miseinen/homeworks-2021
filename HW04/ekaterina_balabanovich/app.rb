require_relative 'lib/student'
require_relative 'lib/mentor'
require_relative 'lib/homework'
require_relative 'lib/notification'

mentor_one = Mentor.new('Ivan', 'Stepanov')
mentor_two = Mentor.new('Trevor', 'Dutch')
student_one = Student.new('Arina', 'Vesyolkova')
student_two = Student.new('Stepan', 'Ivanov')
student_one.subscribe_to(mentor_one)

def puts_with_delimiter(str)
  puts "#{'-' * 30}\n#{str}"
end

homework_one = mentor_one.add_homework(title: 'HW01', description: 'Do something')
puts_with_delimiter('HomeworkOne have been created.')

puts_with_delimiter('StudentOne\'s notifications:')
puts student_one.notifications
student_one.mark_as_read!

puts_with_delimiter('MentorOne assign HomeworkOne to new student.')
mentor_one.assign(homework_one, student_two)

puts_with_delimiter('StudentTwo\'s notifications:')
puts student_two.notifications
student_two.mark_as_read!

puts_with_delimiter('StudentOne\'s homeworks to work:')
student_one.homeworks.each { |a| puts a.title }

puts_with_delimiter('StudentTwo\'s homeworks to work:')
student_two.homeworks.each { |a| puts a.title }

mentor_two.join_to_check(homework_one)
puts_with_delimiter('New mentor joined to review homework.')

student_two.add_answer!(homework_one, 'solving but another way')
student_two.to_check!(homework_one)
puts_with_delimiter('StudentTwo finished homework.')

student_one.add_answer!(homework_one, 'solving')
student_one.to_check!(homework_one)
puts_with_delimiter('StudentOne finished homework.')

puts_with_delimiter('MentorTwo\'s notifications')
mentor_two.notifications.each { |a| puts a }
mentor_two.mark_as_read!

puts_with_delimiter('MentorOne\'s notifications:')
mentor_one.notifications.each { |a| puts a }
mentor_one.mark_as_read!

puts_with_delimiter('MentorOne\'s homeworks to check:')
mentor_one.homeworks.each { |a| puts a.title }

puts_with_delimiter('MentorOne read answer:')
mentor_one.homeworks.each do |a|
  puts a.title
  a.answers.each { |k, v| puts "#{k.surname}: #{v}" }
end

puts_with_delimiter('MentorOne rejected  student\'s homework.')
mentor_one.reject_to_work!(homework_one, student_one)

puts_with_delimiter('StudentOne\'s notifications:')
puts student_one.notifications
student_one.mark_as_read!

student_one.add_answer!(homework_one, 'fixed solving')
student_one.to_check!(homework_one)
puts_with_delimiter('StudentOne fixed homework.')

puts_with_delimiter('MentorOne\'s notifications:')
puts mentor_one.notifications
mentor_one.mark_as_read!

puts_with_delimiter('MentorOne read answer:')
puts "#{student_one.surname}: #{homework_one.answers[student_one]}"

puts_with_delimiter('MentorOne accepted homework.')
mentor_one.accept!(homework_one, student_one)

puts_with_delimiter('StudentOne\'s notifications:')
puts student_one.notifications

puts_with_delimiter('StudentOne\'s homeworks amount to work:')
puts student_one.homeworks.count
