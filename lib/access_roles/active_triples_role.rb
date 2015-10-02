require "active_triples"

module AccessRoles
  class ActiveTriplesRole < ActiveTriples::Resource

    configure type: RolesVocabulary.Role

    property :role_type, predicate: RolesVocabulary.type
    property :agent, predicate: RolesVocabulary.agent
    property :scope, predicate: RolesVocabulary.scope

    def to_h
      serializable_hash(except: :id)
    end

  end
end
