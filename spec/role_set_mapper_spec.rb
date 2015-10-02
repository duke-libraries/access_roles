require "spec_helper"

module AccessRoles
  RSpec.describe RoleSetMapper do

    subject { described_class.new(resource.access_role) }
    
    let(:resource_class) do
      Class.new(ActiveTriples::Resource) do
        property :access_role, predicate: RolesVocabulary.hasRole, class_name: ActiveTriplesRole
      end
    end
    let(:resource) { resource_class.new }

    describe "grant" do
      it "should apply roles to the resource" do
        role = FactoryGirl.build(:role, :viewer, :public, :policy)
        subject.grant role
        subject.commit
        expect(resource.access_role.first.to_h).to eq({"role_type"=>["Viewer"], "agent"=>["public"], "scope"=>["policy"]})
      end
    end

  end
end
