# frozen_string_literal: true

require_relative 'task_manager'
require_relative 'work_state/work_state'
require_relative 'work_state/work_state_new'
require_relative 'work_state/work_state_done'
require_relative 'work_state/work_state_rejected'
require_relative 'work_state/work_state_accepted'

class Homework
  attr_reader :title, :description
  attr_accessor :answers

  def initialize(title, description)
    @title = title
    @description = description
    @answers = Hash.new
  end

  def solve(answer, student)
    @answers[student] = answer
  end
end
