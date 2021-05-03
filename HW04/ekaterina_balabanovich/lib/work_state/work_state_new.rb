# frozen_string_literal: true

class WorkStateNew < WorkState
  def process
    homework.notify(homework.solvers, :new)
    homework.solvers.each { |a| a.get_homework(homework) }
  end
end
