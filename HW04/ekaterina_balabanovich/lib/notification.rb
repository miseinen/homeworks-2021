# frozen_string_literal: true

class Notification
  attr_reader :homework, :note

  def initialize(homework)
    @homework = homework
    @note = { new: "You got new homework: '#{@homework.title}' from #{@homework.mentor.surname}",
              done: "You got '#{@homework.title} from #{@homework.student.surname} to check",
              reject: "Your '#{@homework.title}' have been rejected by #{@homework.mentor.surname}",
              accept: "Your '#{@homework.title} have been accepted by #{@homework.mentor.surname}" }
  end
end
