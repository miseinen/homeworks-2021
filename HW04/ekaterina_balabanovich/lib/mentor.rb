# frozen_string_literal: true

require_relative 'member'
require_relative 'notification_receiver'

class Mentor < Member
  def add_homework(title:, description:)
    Homework.new(title, description, self)
  end

  def reject_to_work!(homework)
    homework.transition_to(WorkStateRejected.new)
  end

  def accept!(homework)
    homework.transition_to(WorkStateAccepted.new)
  end

  def assign(homework, student)
    homework.attach_solver(student)
  end
end
