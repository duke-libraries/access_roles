require "active_model"

module AccessRoles
  class RoleSerializer < SimpleDelegator
    include ActiveModel::Serialization

    def attributes
      { "role_type" => nil,
        "agent" => nil,
        "scope" => nil
      }
    end

  end
end
