require "hashie"

module AccessRoles
  class RoleArguments < Hashie::Hash

    include Hashie::Extensions::MergeInitializer
    # include Hashie::Extensions::MethodReader
    include Hashie::Extensions::Coercion
    include Hashie::Extensions::SymbolizeKeys

    coerce_keys :role_type, :agent, :scope, ->(v) { v.is_a?(Enumerable) ? v.first : v }

    def initialize(args)
      super
      symbolize_keys!
    end

  end
end
