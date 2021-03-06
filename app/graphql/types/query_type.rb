module Types
  class QueryType < Types::BaseObject
    # Add root-level fields here.
    # They will be entry points for queries on your schema.

    field :items, [Types::ItemType],
          null: false, description: 'Returns a list of items in the nerd library.'

    field :users, [Types::UserType],
          null: false, description: 'Returns a list of users of the nerd library.'

    def items
      Item.preload(:user)
    end

    def users
      User.all
    end
  end
end
