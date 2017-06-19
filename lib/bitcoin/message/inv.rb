module Bitcoin
  module Message

    # inv message
    # https://bitcoin.org/en/developer-reference#inv
    class Inv < Base
      include InventoriesParser
      extend InventoriesParser

      attr_reader :inventories

      def initialize(inventories = [])
        @inventories = inventories
      end

      def command
        'inv'
      end

    end

  end
end