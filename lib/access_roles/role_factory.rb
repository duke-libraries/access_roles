module AccessRoles
  class RoleFactory

    private_class_method :new
    
    def self.call(args)
      new(args).call
    end

    attr_reader :role, :validator
      
    def initialize(args)
      role_args = RoleArguments.new(args)
      @role = Role.new(**role_args)
      @validator = RoleValidator.new(role)
    end

    def call
      if validator.invalid?
        raise "Invalid role: #{validator.errors.full_messages.join('; ')}"
      end
      role
    end

  end
end
