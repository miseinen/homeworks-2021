require_relative 'lib/student'
require_relative 'lib/mentor'
require_relative 'lib/homework'
require_relative 'lib/notification'

mentor = Mentor.new('Ivan', 'Stepanov')
student = Student.new('Arina', 'Vesyolkova')

homework = mentor.add_homework(title: 'HW01', description: 'Do something', student: student)
puts 'Homework have been created'

puts 'Student\'s notifications:'
puts student.notifications
student.mark_as_read!

puts 'Homeworks that student has:'
student.homeworks.each { |a| puts a.title }

student.add_answer!(homework, 'solving')
student.to_check!(homework)

puts 'Mentor\'s notifications'
puts mentor.notifications
mentor.mark_as_read!

new_homework = mentor.add_homework(title: 'HW02', description: 'Do something else', student: student)
puts 'Homework have been created'

puts 'Student\'s notifications:'
puts student.notifications
student.mark_as_read!

student.add_answer!(new_homework, 'another solving')
student.to_check!(new_homework)

puts 'Homeworks count before homework rejecting:'
puts student.homeworks.count

puts 'Mentor rejected homework'
mentor.reject_to_work!(new_homework)

puts 'Student\'s notifications:'
puts student.notifications
student.mark_as_read!

puts 'Homeworks after homework rejecting:'
puts student.homeworks.count
student.add_answer!(new_homework, 'fixed solving')
student.to_check!(new_homework)

puts 'Mentor accepted homework'
mentor.accept!(new_homework)

puts 'Student\'s notifications:'
puts student.notifications

puts 'Homeworks count after homework accepting:'
puts student.homeworks.count
