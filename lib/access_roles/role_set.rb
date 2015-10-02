require "forwardable"

module AccessRoles
  #
  # Wraps a set of Roles
  #
  class RoleSet
    include Enumerable
    extend Forwardable

    attr_reader :data

    def_delegators :query,
                   :where, :agent, :scope, :role_type, :type, :agents, :permissions,
                   :in_policy_scope, :in_resource_scope

    def_delegators :data,
                   :each, :to_a, :empty?, :clear, :<<

    def initialize(data = [])
      @data = data.to_set
    end

    # Grants roles - i.e., adds them to the role set
    # @return [RoleSet] self
    def grant(*roles)
      data.merge coerce(roles)
    end

    # Return true/false depending on whether the role has been granted
    def granted?(role)
      include? coerce(role)
    end

    # Revokes roles - i.e., removes them from the role set
    # @return [RoleSet] self
    def revoke(*roles)
      self.data.subtract coerce(roles)
    end

    # Replace the current roles in the role set with new roles
    # @return [RoleSet] self
    def replace(*roles)
      revoke_all
      grant(*roles)
    end

    # Remove all roles from the role set
    # @return [RoleSet] self
    def revoke_all
      clear
    end

    # Merges the roles from another role set into the role set
    # @return [RoleSet] self
    def merge(other)
      data.merge other
      self
    end

    def ==(other)
      if other.is_a? RoleSet
        self.data == other.data
      else
        super
      end
    end

    private

    def query
      RoleSetQuery.new(self)
    end

    def coerce(obj)
      RoleCoercion.call(obj)
    end

  end
end
