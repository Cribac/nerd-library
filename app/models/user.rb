# frozen_string_literal: true

# User
class User < ApplicationRecord
  has_many :items, dependent: :destroy
end
