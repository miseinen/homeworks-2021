# frozen_string_literal: true

class WorkStateAccepted < WorkState
  def process(members)
    homework.notify(members, :accept)
    members.delete_homework(homework)
    homework.detach_solver(members)
  end
end
