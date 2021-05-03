# frozen_string_literal: true

require_relative 'task_solver'
require_relative 'notification_receiver'

class Member
  include TaskSolver
  include NotificationReceiver
  attr_reader :name, :surname, :subscribers

  def initialize(name, surname)
    @name = name
    @surname = surname
    @homeworks = []
    @notifications = []
    @subscribers = []
  end

  def subscribe_to(member)
    member.subscribers << self
  end
end
