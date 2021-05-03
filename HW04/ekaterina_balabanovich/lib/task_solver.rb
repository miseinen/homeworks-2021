# frozen_string_literal: true

module TaskSolver
  attr_reader :homeworks

  def get_homework(homework)
    @homeworks << homework
  end

  def delete_homework(homework)
    @homeworks.delete(homework)
  end
end
