require 'spec_helper'

module AccessRoles
  RSpec.describe Role do

    let(:agent) { "bob@example.com" }

    describe "equality" do
      subject { RoleFactory.call(role_type: "Viewer", agent: "public", scope: "policy") }
      describe "when two roles have the same type, agent and scope" do
        let(:other) { RoleFactory.call(role_type: "Viewer", agent: "public", scope: "policy") }
        it { should eq(other) }
      end
    end

    describe "scope" do
      describe "default scope" do
        subject { RoleFactory.call(role_type: "Curator", agent: agent) }
        its(:scope) { should eq(described_class::DEFAULT_SCOPE) }
      end
      describe "#in_resource_scope?" do
        describe "when scope == 'resource'" do
          subject { RoleFactory.call(role_type: "Curator", agent: agent, scope: "resource") }
          it { should be_in_resource_scope }
        end
        describe "when scope != 'resource'" do
          subject { RoleFactory.call(role_type: "Curator", agent: agent, scope: "policy") }
          it { should_not be_in_resource_scope }
        end
      end
      describe "#in_policy_scope?" do
        describe "when scope != 'policy'" do
          subject { RoleFactory.call(role_type: "Curator", agent: agent, scope: "resource") }
          it { should_not be_in_policy_scope }
        end
        describe "when scope == 'policy'" do
          subject { RoleFactory.call(role_type: "Curator", agent: agent, scope: "policy") }
          it { should be_in_policy_scope }
        end
      end
    end

    describe "validation" do
      it "should require the presence of an agent" do
        expect { RoleFactory.call(role_type: "Curator", agent: nil, scope: "resource") }.to raise_error(StandardError)
        expect { RoleFactory.call(role_type: "Curator", agent: "", scope: "resource") }.to raise_error(StandardError)
      end
      it "should require a valid scope" do
        expect { RoleFactory.call(role_type: "Curator", agent: agent, scope: "") }.to raise_error(StandardError)
        expect { RoleFactory.call(role_type: "Curator", agent: agent, scope: "other") }.to raise_error(StandardError)
      end
      it "should require a valid type" do
        expect { RoleFactory.call(role_type: nil, agent: agent, scope: "policy") }.to raise_error(StandardError)
        expect { RoleFactory.call(role_type: "", agent: agent, scope: "policy") }.to raise_error(StandardError)
        expect { RoleFactory.call(role_type: "Invalid", agent: agent, scope: "policy") }.to raise_error(StandardError)
      end
    end

    Roles.type_map.each_key do |type|
      describe "#{type} role type" do
        Role::SCOPES.each do |scope|
          describe "#{scope} scope" do
            subject { RoleFactory.call(role_type: type, agent: agent, scope: scope) }
            its(:to_h) { is_expected.to eq({"role_type"=>type, "agent"=>agent, "scope"=>scope}) }
            its(:permissions) { is_expected.to eq(Roles.type_map[type].permissions) }
            it "should be isomorphic" do
              expect(subject).to eq(RoleFactory.call(role_type: type, agent: agent, scope: scope))
            end
          end
        end
      end
    end

  end
end
