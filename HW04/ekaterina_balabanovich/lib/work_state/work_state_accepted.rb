# frozen_string_literal: true

class WorkStateAccepted < WorkState
  def process(members, homework)
    TaskHolder.instance.notify(members: members, task: homework, status: :accept)
    members.delete_homework(homework)
    TaskHolder.instance.detach_solver(members, homework)
  end
end
