# frozen_string_literal: true

module TaskManager
  attr_accessor :reviewers, :solvers, :notifications

  def attach_reviewer(member, task)
    @reviewers[task] = [] if @reviewers[task].nil?
    @reviewers[task] << member
  end

  def attach_solver(member, task)
    @solvers[task] = [] if @solvers[task].nil?
    @solvers[task] << member
  end

  def detach_reviewer(member, task)
    @reviewers[task] << member
  end

  def detach_solver(member, task)
    @solvers[task] << member
  end

  def find_reviewer(member, task)
    @reviewers[task].select { |a| a == member }.first
  end

  def find_solver(member, task)
    @solvers[task].select { |a| a == member }.first
  end

  def notify(members:, task:, status:)
    if members.is_a? Array
      members.each { |a| a.get_notifications(@notifications[task.title].note[status]) }
    else
      members.get_notifications(@notifications[task.title].note[status])
    end
  end
end
