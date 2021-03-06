module AccessRoles
  class Permissions

    READ         = :read
    DOWNLOAD     = :download
    ADD_CHILDREN = :add_children
    UPDATE       = :update
    REPLACE      = :replace
    ARRANGE      = :arrange
    AUDIT        = :audit
    GRANT        = :grant

    ALL = [ READ, DOWNLOAD, ADD_CHILDREN, UPDATE, REPLACE, ARRANGE, AUDIT, GRANT ]

  end
end
