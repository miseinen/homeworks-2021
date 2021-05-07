# frozen_string_literal: true

class Member
  attr_reader :name, :surname, :notifications, :homeworks

  def initialize(name, surname)
    @name = name
    @surname = surname
    @homeworks = []
    @notifications = []
  end

  def get_notifications(notification)
    @notifications << notification
  end

  def mark_as_read!
    @notifications.clear
  end

  def get_homework(homework)
    @homeworks << homework
  end

  def delete_homework(homework)
    @homeworks.delete(homework)
  end
end
