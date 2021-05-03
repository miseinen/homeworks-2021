require_relative 'lib/student'
require_relative 'lib/mentor'
require_relative 'lib/homework'
require_relative 'lib/notification'

mentor = Mentor.new('Ivan', 'Stepanov')
student = Student.new('Arina', 'Vesyolkova')

homework = mentor.add_homework(title: 'HW01', description: 'Do something', student: student)
puts 'Homework have been created.'

puts 'Student\'s notifications:'
puts student.notifications
student.mark_as_read!

puts 'Student\'s homeworks to done:'
student.homeworks.each { |a| puts a.title }

student.add_answer!(homework, 'solving')
student.to_check!(homework)
puts 'Student finished homework.'

puts 'Mentor\'s notifications:'
puts mentor.notifications
mentor.mark_as_read!

puts 'Mentor\'s homeworks to check:'
mentor.homeworks.each { |a| puts a.title }

puts 'Mentor read answer:'
mentor.homeworks.each { |a| puts "#{a.title}: '#{a.answer}' by #{a.student.surname}" }

puts 'Mentor rejected homework.'
mentor.reject_to_work!(homework)

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
mentor.homeworks.each { |a| puts "#{a.title}: '#{a.answer}' by #{a.student.surname}" }

puts 'Mentor accepted homework.'
mentor.accept!(homework)

puts 'Student\'s notifications:'
puts student.notifications
