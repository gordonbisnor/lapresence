# frozen_string_literal: true

FactoryBot.define do
  sequence(:email) { |n| "user#{n}@email.com" }
  factory :user do
    email { generate(:email) }
    password { 'asdasd55' }
    password_confirmation { 'asdasd55' }
  end
end
