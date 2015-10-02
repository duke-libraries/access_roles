# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'access_roles/version'

Gem::Specification.new do |spec|
  spec.name          = "access_roles"
  spec.version       = AccessRoles::VERSION
  spec.authors       = ["David Chandek-Stark"]
  spec.email         = ["dchandekstark@gmail.com"]

  spec.summary       = %q{Access role management library for role-based access control.}
  spec.description   = %q{Access role management library for role-based access control, based on RDF and ActiveTriples.}
  spec.homepage      = "https://github.com/duke-libraries/access_roles"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "activemodel"
  spec.add_dependency "hashie"
  spec.add_dependency "active-triples", ">= 0.2.3", "< 0.7"

  spec.add_development_dependency "bundler", "~> 1.10"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec"
  spec.add_development_dependency "rspec-its"
  spec.add_development_dependency "factory_girl"
end
