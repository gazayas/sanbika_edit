require 'spec_helper'

FactoryGirl.define do
  factory :user do
    sequence(:id) {|n| n + 1}
    sequence(:name) {|n| "geeb" + n.to_s}
    sequence(:email) {|n| "geeb" + n.to_s + "@example.com"}
    sequence(:password) {|n| "supbro" + n.to_s}
  end
end
