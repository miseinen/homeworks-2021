# frozen_string_literal: true

require_relative 'notification_receiver'

class Mentor
  include NotificationReceiver
  attr_reader :name, :surname, :students, :notifications

  def initialize(name, surname)
    @name = name
    @surname = surname
    @students = []
    @notifications = []
  end

  def add_homework(title:, description:, student:)
    Homework.new(title, description, student, self)
  end

  def reject_to_work!(homework)
    homework.transition_to(WorkStateRejected.new)
  end

  def accept!(homework)
    homework.transition_to(WorkStateAccepted.new)
  end
end
