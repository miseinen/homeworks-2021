# frozen_string_literal: true

require_relative 'task_manager'
require_relative 'work_state/work_state'
require_relative 'work_state/work_state_new'
require_relative 'work_state/work_state_done'
require_relative 'work_state/work_state_rejected'
require_relative 'work_state/work_state_accepted'

class Homework
  include TaskManager
  attr_reader :title, :description, :state, :notification
  attr_accessor :answers

  def initialize(title, description, mentor)
    @title = title
    @description = description

    @reviewers = []
    attach_reviewer(mentor)

    @solvers = []
    mentor.subscribers.each { |a| attach_solver(a) }

    @answers = Hash.new
    @notification = Notification.new(self)
    transition_to(WorkStateNew.new, solvers)
  end

  def transition_to(state, members)
    @state = state
    @state.homework = self
    @state.process(members)
  end

  def solve(answer, student)
    @answers[student] = answer
  end
end
