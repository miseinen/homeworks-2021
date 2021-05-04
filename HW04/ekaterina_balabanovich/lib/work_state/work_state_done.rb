# frozen_string_literal: true

class WorkStateDone < WorkState
  def process(members, homework)
    WorksManager.instance.notify(members: members, task: homework, status: :done)
    members.each { |a| a.get_homework(homework) unless a.homeworks.include?(homework) }
  end
end
