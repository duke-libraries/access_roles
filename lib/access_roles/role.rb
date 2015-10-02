module AccessRoles
  class Role

    RESOURCE_SCOPE = "resource".freeze
    POLICY_SCOPE = "policy".freeze
    SCOPES = [RESOURCE_SCOPE, POLICY_SCOPE].freeze
    DEFAULT_SCOPE = RESOURCE_SCOPE

    attr_reader :role_type, :agent, :scope

    def initialize(role_type:, agent:, scope: DEFAULT_SCOPE)
      @role_type = role_type
      @agent     = agent
      @scope     = scope
    end

    # Roles are considered equivalent (== and eql?) if they
    # are of the same type and have the same agent and scope.
    # @return [Boolean] the result
    def ==(other)
      if self.class == other.class
        (self.role_type == other.role_type) &&
        (self.agent     == other.agent) &&
        (self.scope     == other.scope)
      else
        super
      end
    end

    def eql?(other)
      (self == other) && (hash == other.hash)
    end

    def hash
      to_h.hash
    end

    def to_json
      RoleSerializer.new(self).to_json
    end

    def to_h
      RoleSerializer.new(self).serializable_hash
    end

    def to_s
      # Curator("bob@example.com", scope: "resource")
      "#{role_type}(#{agent.inspect}, scope: #{scope.inspect})"
    end

    def in_resource_scope?
      scope == RESOURCE_SCOPE
    end

    def in_policy_scope?
      scope == POLICY_SCOPE
    end

    alias_method :to_hash, :to_h

    # Returns the permissions associated with the role
    # @return [Array<Symbol>] the permissions
    def permissions
      Roles.type_map[role_type].permissions
    end

  end
end
