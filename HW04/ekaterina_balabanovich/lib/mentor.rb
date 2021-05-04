# frozen_string_literal: true

require_relative 'member'
require_relative 'task_holder'

class Mentor < Member
  def add_homework(title:, description:)
    homework = Homework.new(title, description)
    TaskHolder.instance.attach_new_homework(homework)
    TaskHolder.instance.attach_reviewer(self, homework)
    homework
  end

  def reject_to_work!(homework, student)
    student = TaskHolder.instance.find_solver(student, homework)
    TaskHolder.instance.transition_to(WorkStateRejected.new, student, homework)
  end

  def accept!(homework, student)
    student = TaskHolder.instance.find_solver(student, homework)
    TaskHolder.instance.transition_to(WorkStateAccepted.new, student, homework)
  end

  def assign(homework, student)
    TaskHolder.instance.attach_solver(student, homework)
    solver = TaskHolder.instance.find_solver(student, homework)
    WorkStateNew.new.process(solver, homework)
  end

  def join_to_check(homework)
    TaskHolder.instance.attach_reviewer(self, homework)
  end
end
