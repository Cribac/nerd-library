# frozen_string_literal: true

module Types
  # User
  class UserType < Types::BaseObject
    field :id, ID, null: false
    field :email, String, null: false
    field :user_name, String, null: false
    field :uppercase_name, String, null: false

    def uppercase_name
      object.user_name.upcase
    end
  end
end
