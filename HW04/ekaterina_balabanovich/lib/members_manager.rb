# frozen_string_literal: true

require_relative 'task_participant'

module MembersManager
  attr_accessor :reviewers, :solvers

  def attach_reviewer(member, task)
    reviewers << TaskParticipant.new(member, task)
  end

  def attach_solver(member, task)
    solvers << TaskParticipant.new(member, task)
  end

  def detach_reviewer(member, task)
    reviewers.delete(find_reviewer(member, task))
  end

  def detach_solver(member, task)
    solvers.delete(find_solver(member, task))
  end

  def find_reviewer(member, task)
    reviewers.select { |reviewer| reviewer.member == member && reviewer.task == task }.first.member
  end

  def find_solver(member, task)
    solvers.select { |solver| solver.member == member && solver.task == task}.first.member
  end

  def find_reviewers_by_task(task)
    reviewers.select { |reviewer| reviewer.task == task }.map(&:member)
  end

  def find_solvers_by_task(task)
    solvers.select { |solver| solver.task == task }.map(&:member)
  end
end
