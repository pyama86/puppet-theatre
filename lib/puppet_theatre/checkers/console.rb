module PuppetTheatre
  module Checkers
    class Console < Base
      def call(_env, host)
        puts "Checking #{host}..."

        nil
      end
    end
  end
end
