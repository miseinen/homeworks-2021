# frozen_string_literal: true

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
