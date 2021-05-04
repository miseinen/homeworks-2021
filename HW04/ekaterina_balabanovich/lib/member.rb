# frozen_string_literal: true

require_relative 'task_solver'
require_relative 'notification_receiver'

class Member
  include TaskSolver
  include NotificationReceiver
  attr_reader :name, :surname

  def initialize(name, surname)
    @name = name
    @surname = surname
    @homeworks = []
    @notifications = []
  end
end
