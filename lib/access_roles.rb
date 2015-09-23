require "access_roles/version"

module AccessRoles

  autoload :DetachedRoleSet, "access_roles/detached_role_set"
  autoload :Permissions, "access_roles/permissions"
  autoload :PropertyRoleSet, "access_roles/property_role_set"
  autoload :Role, "access_roles/role"
  autoload :Roles, "access_roles/roles"
  autoload :RolesVocabulary, "access_roles/roles_vocabulary"
  autoload :RoleSet, "access_roles/role_set"
  autoload :RoleSetQuery, "access_roles/role_set_query"
  autoload :RoleType, "access_roles/role_type"
  autoload :RoleTypes, "access_roles/role_types"

end
