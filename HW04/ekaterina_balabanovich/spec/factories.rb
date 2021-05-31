# frozen_string_literal: true

FactoryBot.define do
  factory :student do
    skip_create

    name { 'John' }
    surname { 'Doe' }

    initialize_with { new(name, surname) }
  end
end
