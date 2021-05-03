# frozen_string_literal: true

require_relative 'member'
require_relative 'notification_receiver'

class Mentor < Member
  def add_homework(title:, description:)
    Homework.new(title, description, self)
  end

  def reject_to_work!(homework, student)
    student = homework.find_solver(student)
    homework.transition_to(WorkStateRejected.new, student)
  end

  def accept!(homework, student)
    student = homework.find_solver(student)
    homework.transition_to(WorkStateAccepted.new, student)
  end

  def assign(homework, student)
    homework.attach_solver(student)
    workstate = WorkStateNew.new
    workstate.homework = homework
    workstate.process(student)
  end
end
