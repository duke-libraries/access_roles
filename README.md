# AccessRoles

Access role management library for role-based access control, based on RDF and ActiveTriples. Originally developed to support role-based access control in Hydra. See http://duke-libraries.github.io/2015/09/08/hydra-role-based-access-control.html.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'access_roles'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install access_roles

## Usage

ActiveFedora 7.x/8.x

```ruby
class MyDatastream < ActiveFedora::NtriplesRDFDatastream
  # You may use your own property name and predicate
  property :access_role, 
    predicate: AccessRoles::RolesVocabulary.hasRole,
    class_name: AccessRoles::Role
end
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake rspec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/access_roles.

