# frozen_string_literal: true

class WorkStateAccepted < WorkState
  def process(members)
    homework.notify(members, :accept)
  end
end
