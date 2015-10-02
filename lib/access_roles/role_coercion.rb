module AccessRoles
  class RoleCoercion

    class << self
      def call(obj)
        case obj
        when Hash
          RoleFactory.call(obj)
        when ActiveTriplesRole
          call obj.to_h
        when Role
          obj
        when Enumerable
          obj.map { |r| call(r) }.flatten
        else
          raise ArgumentError, "Cannot coerce #{obj.inspect}"
        end
      end
    end
    
  end
end
