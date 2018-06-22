# Facturama

Small Facturama Client.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'facturama', git: 'https://github.com/NebulaFintech/facturama.git'
```

And then execute:

    $ bundle

## Usage

```
Facturama.configure do |config|
  config.user = 'user'
  config.password = 'password'
end
csd = Facturama::Csd.create(rfc: 'rfc', certificate: 'cer', private_key: 'key', private_key_password: 'pass')

=> #<Facturama::Csd:0x00007fa0d7306450 @id="rfc", @rfc="rfc", @certificate="cer", @private_key="key", @private_key_password="pass">

csd.delete

=> #<Facturama::Csd:0x00007fa0d7306450 @id="rfc", @rfc="rfc", @certificate="cer", @private_key="key", @private_key_password="pass">
```

## Development

After checking out the repo, run `bundle` to install dependencies. Then, run `rspec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags.

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/NebulaFintech/facturama. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the Facturama project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/NebulaFintech/facturama/blob/master/CODE_OF_CONDUCT.md).
