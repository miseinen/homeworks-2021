# frozen_string_literal: true

class WorkStateRejected < WorkState
  def process(members)
    homework.notify(members, :reject)
  end
end
