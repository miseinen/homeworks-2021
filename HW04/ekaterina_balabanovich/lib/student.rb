# frozen_string_literal: true

require_relative 'member'

class Student < Member
  def add_answer!(homework, answer)
    homework.solve(answer, self)
  end

  def to_check!(homework)
    reviewers = HomeworksManager.instance.find_reviewers_by_task(homework)
    HomeworksManager.instance.transition_to(WorkState::Done.new, reviewers, homework)
  end
end
