# frozen_string_literal: true

class WorkStateRejected < WorkState
  def process
    homework.notify(homework.solvers, :reject)
  end
end
