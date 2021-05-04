# frozen_string_literal: true

require 'singleton'
require_relative 'task_manager'
require_relative 'work_state/work_state'
require_relative 'work_state/work_state_new'
require_relative 'work_state/work_state_done'
require_relative 'work_state/work_state_rejected'
require_relative 'work_state/work_state_accepted'

class TaskHolder
  include TaskManager
  include Singleton

  attr_reader :homeworks, :state

  def initialize
    @reviewers = Hash.new
    @solvers = Hash.new
    @notifications = Hash.new
    @@homeworks = []
  end

  def transition_to(state, members, homework)
    @state = state
    @state.process(members, homework)
  end

  def attach_new_homework(homework)
    @@homeworks << homework
    @notifications[homework.title] = Notification.new(homework)
  end
end
