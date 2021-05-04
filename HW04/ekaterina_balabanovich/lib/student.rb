# frozen_string_literal: true

require_relative 'member'

class Student < Member
  def add_answer!(homework, answer)
    homework.solve(answer, self)
  end

  def to_check!(homework)
    WorksManager.instance.transition_to(WorkStateDone.new, WorksManager.instance.reviewers[homework], homework)
  end
end
