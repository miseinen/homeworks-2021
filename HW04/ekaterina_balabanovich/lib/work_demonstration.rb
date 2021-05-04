# frozen_string_literal: true

require_relative 'student'
require_relative 'mentor'
require_relative 'homework'
require_relative 'notification'

class WorkDemonstration
  def run
    mentor_one = create_mentor('Ivan', 'Stepanov')
    mentor_two = create_mentor('Trevor', 'Dutch')
    student_one = create_student('Arina', 'Vesyolkova')
    student_two = create_student('Stepan', 'Ivanov')

    homework_one = create_homework('HW01', 'Do something', mentor_one)
    homework_two = create_homework('HW02', 'Resolve please', mentor_one)

    assign_homework(mentor_one, student_one, homework_one)

    join_to_review(mentor_two, homework_two)
    assign_homework(mentor_two, student_two, homework_two)

    read_notifications(student_one)
    read_notifications(student_two)

    show_homeworks(student_one)
    show_homeworks(student_two)

    send_to_check(student_one, homework_one, 'Long story')
    send_to_check(student_two, homework_two, 'Hoping')

    read_notifications(mentor_one)
    read_notifications(mentor_two)

    show_homeworks(mentor_one)
    show_homeworks(mentor_two)

    show_answers(mentor_one)
    show_answers(mentor_two)

    accept_work(mentor_one, student_one, homework_one)
    reject_work(mentor_two, student_two, homework_two)

    assign_homework(mentor_two, student_one, homework_two)

    read_notifications(student_one)
    read_notifications(student_two)

    send_to_check(student_two, homework_two, 'Fixed')
    send_to_check(student_one, homework_two, 'My solution')

    read_notifications(mentor_two)
    show_answers(mentor_two)
  end

  def create_mentor(name, surname)
    puts_with_delimiter("Mentor #{name} #{surname} has been created")
    Mentor.new(name, surname)
  end

  def create_student(name, surname)
    puts_with_delimiter("Student #{name} #{surname} has been created")
    Student.new(name, surname)
  end

  def create_homework(title, description, mentor)
    puts_with_delimiter("Homework #{title} has been created by #{mentor.surname}")
    mentor.add_homework(title: title, description: description)
  end

  def assign_homework(mentor, student, homework)
    puts_with_delimiter("Mentor #{mentor.surname} assigned #{homework.title} to #{student.surname}")
    mentor.assign(homework, student)
  end

  def join_to_review(member, homework)
    member.join_to_check(homework)
    puts_with_delimiter("#{member.class} #{member.surname} joined to review #{homework.title}")
  end

  def read_notifications(member)
    puts_with_delimiter("#{member.class} #{member.surname}\'s notifications:")
    member.notifications.each { |a| puts a }
    member.mark_as_read!
  end

  def show_homeworks(member)
    puts_with_delimiter("#{member.class} #{member.surname}\'s homeworks (to work/to check):")
    member.homeworks.each { |a| puts a.title }
  end

  def show_answers(member)
    puts_with_delimiter("#{member.class} #{member.surname} see answers")
    member.homeworks.each do |a|
      puts a.title
      a.answers.each { |k, v| puts "#{k.surname}: #{v}" }
    end
  end

  def reject_work(mentor, student, homework)
    puts_with_delimiter("#{mentor.class} #{mentor.surname} rejected #{student.surname}\'s work")
    mentor.reject_to_work!(homework, student)
  end

  def accept_work(mentor, student, homework)
    puts_with_delimiter("#{mentor.class} #{mentor.surname} accepted #{student.surname}\'s work")
    mentor.accept!(homework, student)
  end

  def send_to_check(student, homework, answer)
    student.add_answer!(homework, answer)
    student.to_check!(homework)
    puts_with_delimiter("#{student.class} #{student.surname} finished #{homework.title}")
  end

  def puts_with_delimiter(str)
    puts "#{'-' * 30}\n#{str}"
  end
end
