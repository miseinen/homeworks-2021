# frozen_string_literal: true

module HomeworkState
  class New < Base
    def process(members, homework)
      HomeworksManager.instance.notify(members: members, homework: homework, status: :new)
      if members.is_a? Array
        members.each { |member| member.add_homework(homework) }
      else
        members.add_homework(homework)
      end
    end
  end
end
