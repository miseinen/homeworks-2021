# frozen_string_literal: true

class Notification
  attr_reader :homework, :note

  def initialize(homework)
    @homework = homework
    @note = { new: new_message,
              done: done_message,
              reject: reject_message,
              accept: accept_message }
  end

  def new_message
    "You got new homework: '#{homework.title}' to work"
  end

  def done_message
    "You got '#{homework.title} to check"
  end

  def reject_message
    "Your '#{homework.title}' have been rejected"
  end

  def accept_message
    "Your '#{homework.title} have been accepted"
  end
end
