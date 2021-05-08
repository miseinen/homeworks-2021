# frozen_string_literal: true

module HomeworkState
  class Accepted < Base
    def process(members, homework)
      HomeworksManager.instance.notify(members: members, task: homework, status: :accept)
      members.delete_homework(homework)
      HomeworksManager.instance.detach_solver(members, homework)
    end
  end
end
