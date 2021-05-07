# frozen_string_literal: true

module MembersManager
  attr_accessor :reviewers, :solvers

  def attach_reviewer(member, task)
    reviewers[task] = [] if @reviewers[task].nil?
    reviewers[task] << member
  end

  def attach_solver(member, task)
    solvers[task] = [] if @solvers[task].nil?
    solvers[task] << member
  end

  def detach_reviewer(member, task)
    reviewers[task].delete(member)
  end

  def detach_solver(member, task)
    solvers[task].delete(member)
  end

  def find_reviewer(member, task)
    reviewers[task].select { |a| a == member }.first
  end

  def find_solver(member, task)
    solvers[task].select { |a| a == member }.first
  end
end
