# frozen_string_literal: true

FactoryBot.define do
  factory :bandwidth do
    value { rand(90.0..900.0) }
    interface_name { Faker::Name.middle_name }
    value_id { rand(0..10) }
  end
end
