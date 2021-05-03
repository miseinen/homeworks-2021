require_relative 'lib/student'
require_relative 'lib/mentor'
require_relative 'lib/homework'
require_relative 'lib/notification'

mentor = Mentor.new('Ivan', 'Stepanov')
student = Student.new('Arina', 'Vesyolkova')
student_new = Student.new('Stepan', 'Ivanov')
student.subscribe_to(mentor)

homework = mentor.add_homework(title: 'HW01', description: 'Do something')
puts 'Homework have been created.'

puts 'Student\'s notifications:'
puts student.notifications
student.mark_as_read!

puts 'Mentor assign homework to new student'
mentor.assign(homework, student_new)

puts 'New student\'s notifications:'
puts student_new.notifications
student_new.mark_as_read!

puts 'Student\'s homeworks to done:'
student.homeworks.each { |a| puts a.title }

puts 'New student\'s homeworks to done:'
student_new.homeworks.each { |a| puts a.title }

student_new.add_answer!(homework, 'solving but another way')
student_new.to_check!(homework)
puts 'New student finished homework.'

student.add_answer!(homework, 'solving')
student.to_check!(homework)
puts 'Student finished homework.'

puts 'Mentor\'s notifications:'
mentor.notifications.each { |a| puts a }
mentor.mark_as_read!

puts 'Mentor\'s homeworks to check:'
mentor.homeworks.each { |a| puts a.title }

puts 'Mentor read answer:'
mentor.homeworks.each do |a|
  puts a.title
  a.answers.each { |k, v| puts "#{k.surname}: #{v}" }
end

puts 'Mentor rejected  student\'s homework.'
mentor.reject_to_work!(homework, student)

puts 'Student\'s notifications:'
puts student.notifications
student.mark_as_read!

student.add_answer!(homework, 'fixed solving')
student.to_check!(homework)
puts 'Student fixed homework.'

puts 'Mentor\'s notifications:'
puts mentor.notifications
mentor.mark_as_read!

puts 'Mentor read answer:'
mentor.homeworks.each do |a|
  puts a.title
  a.answers.each { |k, v| puts "#{k.surname}: #{v}" }
end

puts 'Mentor accepted homework.'
mentor.accept!(homework, student)

puts 'Student\'s notifications:'
puts student.notifications
