# frozen_string_literal: true

require_relative 'notification_receiver'

class Student
  include NotificationReceiver
  attr_reader :name, :surname, :homeworks

  def initialize(name, surname)
    @name = name
    @surname = surname
    @homeworks = []
    @notifications = []
  end

  def add_answer!(homework, answer)
    homework.solve(answer)
  end

  def to_check!(homework)
    homework.transition_to(WorkStateDone.new)
  end

  def get_homework(homework)
    @homeworks << homework
  end

  def delete_homework(homework)
    @homeworks.delete(homework)
  end
end
