# frozen_string_literal: true

require_relative 'member'
require_relative 'notification_receiver'

class Student < Member
  def add_answer!(homework, answer)
    homework.solve(answer, self)
  end

  def to_check!(homework)
    TaskHolder.instance.transition_to(WorkStateDone.new, TaskHolder.instance.reviewers[homework], homework)
  end
end
