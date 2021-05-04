# frozen_string_literal: true

class WorkStateRejected < WorkState
  def process(members, homework)
    TaskHolder.instance.notify(members: members, task: homework, status: :reject)
  end
end
