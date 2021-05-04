# frozen_string_literal: true

class WorkStateNew < WorkState
  def process(members, homework)
    WorksManager.instance.notify(members: members, task: homework, status: :new)
    if members.is_a? Array
      members.each { |a| a.get_homework(homework) }
    else
      members.get_homework(homework)
    end
  end
end
