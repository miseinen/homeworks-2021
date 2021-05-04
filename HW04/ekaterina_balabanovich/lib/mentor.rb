# frozen_string_literal: true

require_relative 'member'
require_relative 'works_manager'

class Mentor < Member
  def add_homework(title:, description:)
    homework = Homework.new(title, description)
    WorksManager.instance.attach_new_homework(homework)
    WorksManager.instance.attach_reviewer(self, homework)
    homework
  end

  def reject_to_work!(homework, student)
    student = WorksManager.instance.find_solver(student, homework)
    WorksManager.instance.transition_to(WorkStateRejected.new, student, homework)
  end

  def accept!(homework, student)
    student = WorksManager.instance.find_solver(student, homework)
    WorksManager.instance.transition_to(WorkStateAccepted.new, student, homework)
  end

  def assign(homework, student)
    WorksManager.instance.attach_solver(student, homework)
    solver = WorksManager.instance.find_solver(student, homework)
    WorkStateNew.new.process(solver, homework)
  end

  def join_to_check(homework)
    WorksManager.instance.attach_reviewer(self, homework)
  end
end
