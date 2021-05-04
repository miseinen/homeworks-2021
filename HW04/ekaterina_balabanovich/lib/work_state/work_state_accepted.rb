# frozen_string_literal: true

class WorkStateAccepted < WorkState
  def process(members, homework)
    WorksManager.instance.notify(members: members, task: homework, status: :accept)
    members.delete_homework(homework)
    WorksManager.instance.detach_solver(members, homework)
  end
end
