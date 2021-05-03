# frozen_string_literal: true

module TaskHolder
  attr_accessor :reviewers, :solvers

  def attach_reviewer(member)
    @reviewers << member
  end

  def attach_solver(member)
    @solvers << member
  end

  def detach_reviewer(member)
    @reviewers << member
  end

  def detach_solver(member)
    @solvers << member
  end

  def find_reviewer(member)
    @reviewers.find(member)
  end

  def find_solver(member)
    @solvers.find(member)
  end

  def notify(members, status)
    members.each { |a| a.get_notifications(notification.note[status]) }
  end
end
