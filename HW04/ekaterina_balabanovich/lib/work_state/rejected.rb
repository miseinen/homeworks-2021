# frozen_string_literal: true

module WorkState
  class Rejected < Base
    def process(members, homework)
      WorksManager.instance.notify(members: members, task: homework, status: :reject)
    end
  end
end
