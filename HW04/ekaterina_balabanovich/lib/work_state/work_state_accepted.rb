# frozen_string_literal: true

class WorkStateAccepted < WorkState
  def process(members)
    homework.notify(members, :accept)
    if members.is_a? Array
      members.each { |a| a.delete_homework(homework) }
    else
      members.delete_homework(homework)
    end
  end
end
