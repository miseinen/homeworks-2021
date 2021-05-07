# frozen_string_literal: true

require 'singleton'
require_relative 'members_manager'
require_relative 'work_state/base'
require_relative 'work_state/new'
require_relative 'work_state/done'
require_relative 'work_state/rejected'
require_relative 'work_state/accepted'

class WorksManager
  include MembersManager
  include Singleton

  attr_reader :homeworks, :state, :notifications

  def initialize
    @reviewers = []
    @solvers = []
    @notifications = []
    @homeworks = []
  end

  def transition_to(state, members, homework)
    @state = state
    state.process(members, homework)
  end

  def attach_new_homework(homework)
    homeworks << homework
    notifications << Notification.new(homework)
  end

  def notify(members:, task:, status:)
    if members.is_a? Array
      members.each { |member| member.add_notifications(find_notification(task).note[status]) }
    else
      members.add_notifications(find_notification(task).note[status])
    end
  end

  private

  def find_notification(homework)
    notifications.select { |notification| notification.homework == homework }.first
  end
end
