# frozen_string_literal: true

class TaskParticipant
  attr_reader :member, :task

  def initialize(member, task)
    @member = member
    @task = task
  end
end
