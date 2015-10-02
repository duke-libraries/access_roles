require "active_model"
require "delegate"

module AccessRoles
  class RoleValidator < SimpleDelegator
    include ActiveModel::Validations
    
    validates :role_type, inclusion: { in: Roles.type_map.keys }
    validates :agent, presence: true
    validates :scope, inclusion: { in: Role::SCOPES }

  end
end
