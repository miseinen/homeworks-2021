# frozen_string_literal: true

class WorkStateAccepted < WorkState
  def process
    homework.notify(homework.solvers, :accept)
  end
end
