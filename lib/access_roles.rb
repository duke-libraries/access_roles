require "access_roles/version"
require "active_triples"

module AccessRoles

  autoload :ActiveTriplesRole, "access_roles/active_triples_role"
  autoload :ActiveTriplesRoleMapper, "access_roles/active_triples_role_mapper"
  autoload :Permissions, "access_roles/permissions"
  autoload :Role, "access_roles/role"
  autoload :Roles, "access_roles/roles"
  autoload :RolesVocabulary, "access_roles/roles_vocabulary"
  autoload :RoleArguments, "access_roles/role_arguments"
  autoload :RoleCoercion, "access_roles/role_coercion"
  autoload :RoleFactory, "access_roles/role_factory"
  autoload :RoleSerializer, "access_roles/role_serializer"
  autoload :RoleSet, "access_roles/role_set"
  autoload :RoleSetMapper, "access_roles/role_set_mapper"
  autoload :RoleSetQuery, "access_roles/role_set_query"
  autoload :RoleType, "access_roles/role_type"
  autoload :RoleTypes, "access_roles/role_types"
  autoload :RoleValidator, "access_roles/role_validator"

end
