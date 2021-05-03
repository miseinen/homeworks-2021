# frozen_string_literal: true

class WorkStateDone < WorkState
  def process
    homework.notify(homework.reviewers, :done)
    homework.reviewers.each { |a| a.get_homework(homework) }
  end
end
