# frozen_string_literal: true

class WorkStateAccepted < WorkState
  def process
    homework.student.delete_homework(homework)
    homework.mentor.get_homework(homework)
    homework.student.get_notifications(homework.notification.note[:accept])
  end
end
