# frozen_string_literal: true

module WorkState
  class Done < Base
    def process(members, homework)
      WorksManager.instance.notify(members: members, task: homework, status: :done)
      members.each { |member| member.add_homework(homework) unless member.homeworks.include?(homework) }
    end
  end
end
