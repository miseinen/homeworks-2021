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
    @reviewers.select{ |a| a == member }.first
  end

  def find_solver(member)
    @solvers.select{ |a| a == member }.first
  end

  def notify(members, status)
    if members.is_a? Array
      members.each { |a| a.get_notifications(notification.note[status]) }
    else
      members.get_notifications(notification.note[status])
    end
  end
end
