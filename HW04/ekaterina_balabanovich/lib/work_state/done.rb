# frozen_string_literal: true

module WorkState
  class Done < Base
    def process(members, homework)
      WorksManager.instance.notify(members: members, task: homework, status: :done)
      members.each { |a| a.add_homework(homework) unless a.homeworks.include?(homework) }
    end
  end
end
