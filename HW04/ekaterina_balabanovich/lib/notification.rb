# frozen_string_literal: true

class Notification
  attr_reader :homework, :note

  def initialize(homework)
    @homework = homework
    @note = { new: "You got new homework: '#{homework.title}' to work",
              done: "You got '#{homework.title} to check",
              reject: "Your '#{homework.title}' have been rejected",
              accept: "Your '#{homework.title} have been accepted" }
  end
end
