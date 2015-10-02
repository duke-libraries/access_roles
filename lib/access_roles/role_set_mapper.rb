module AccessRoles
  class RoleSetMapper < SimpleDelegator

    attr_reader :relation
    
    def initialize(relation)
      @relation = relation
      reset
    end

    def commit
      update
      reset
    end

    def reset
      __setobj__ role_set
      self
    end

    private
    
    def role_set
      relation.reduce(RoleSet.new) { |memo, resource| memo << RoleFactory.call(resource.to_h) }
    end

    def update
      roles = map { |role| ActiveTriplesRole.new.tap { |atr| atr.attributes = role.to_h } }
      relation.set roles
    end

  end
end
