# Apollo-Ruby

🚀Ruby client for ctrip/apollo (https://github.com/apolloconfig/apollo)

## Installation

Install the gem and add to the Rails application's Gemfile by executing:

    $ bundle add apollo-ruby

If bundler is not being used to manage dependencies, install the gem by executing:

    $ gem install apollo-ruby

## Usage

You'll need to configure it in `config/initializers/apollo.rb`:

```ruby
Apollo.configure do |config|
  config.appid = ENV['APOLLO_APPID']
  config.secret = ENV['APOLLO_SECRET']
  config.server = ENV['APOLLO_SERVER']
end
```

Then you can get the configuration from Apollo using the following code:

```ruby
Apollo.fetch("your configuration key")
```

## Contributing

1. Fork it
2. Create your feature branch (git checkout -b my-new-feature)
3. Commit your changes (git commit -am 'Added some feature')
4. Push to the branch (git push origin my-new-feature)
5. Create new Pull Request

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Changelog

See the [CHANGELOGS.md](./CHANGELOG.md).
