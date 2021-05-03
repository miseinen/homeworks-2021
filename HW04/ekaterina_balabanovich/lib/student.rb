# frozen_string_literal: true

require_relative 'member'
require_relative 'notification_receiver'

class Student < Member
  def add_answer!(homework, answer)
    homework.solve(answer)
  end

  def to_check!(homework)
    homework.transition_to(WorkStateDone.new)
  end
end
