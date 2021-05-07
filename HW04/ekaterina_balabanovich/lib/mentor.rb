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
    solver = WorksManager.instance.find_solver(student, homework)
    WorksManager.instance.transition_to(WorkState::Rejected.new, solver, homework)
  end

  def accept!(homework, student)
    solver = WorksManager.instance.find_solver(student, homework)
    WorksManager.instance.transition_to(WorkState::Accepted.new, solver, homework)
  end

  def assign(homework, student)
    WorksManager.instance.attach_solver(student, homework)
    solver = WorksManager.instance.find_solver(student, homework)
    WorkState::New.new.process(solver, homework)
  end

  def join_to_check(homework)
    WorksManager.instance.attach_reviewer(self, homework)
  end
end
