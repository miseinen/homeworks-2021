# frozen_string_literal: true

module WorkState
  class Rejected < Base
    def process(members, homework)
      HomeworksManager.instance.notify(members: members, task: homework, status: :reject)
    end
  end
end
