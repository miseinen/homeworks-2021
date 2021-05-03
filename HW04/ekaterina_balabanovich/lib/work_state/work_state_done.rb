# frozen_string_literal: true

class WorkStateDone < WorkState
  def process(members)
    homework.notify(members, :done)
    members.each { |a| a.get_homework(homework) unless a.homeworks.include?(homework) }
  end
end
