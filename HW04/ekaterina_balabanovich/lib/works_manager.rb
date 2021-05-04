# frozen_string_literal: true

require 'singleton'
require_relative 'members_manager'
require_relative 'work_state/work_state'
require_relative 'work_state/work_state_new'
require_relative 'work_state/work_state_done'
require_relative 'work_state/work_state_rejected'
require_relative 'work_state/work_state_accepted'

class WorksManager
  include MembersManager
  include Singleton

  attr_reader :homeworks, :state

  def initialize
    @reviewers = Hash.new
    @solvers = Hash.new
    @@notifications = Hash.new
    @@homeworks = []
  end

  def transition_to(state, members, homework)
    @state = state
    @state.process(members, homework)
  end

  def attach_new_homework(homework)
    @@homeworks << homework
    @@notifications[homework.title] = Notification.new(homework)
  end

  def notify(members:, task:, status:)
    if members.is_a? Array
      members.each { |a| a.get_notifications(@@notifications[task.title].note[status]) }
    else
      members.get_notifications(@@notifications[task.title].note[status])
    end
  end
end
