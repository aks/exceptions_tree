# ExceptionsTree

When dealing with errors, ruby developers are encouraged to capture specific
exceptions, but seeing which exceptions are currently configured (and thus
possible) is a challenge, especially with exceptions being dynamically
configured as gems are loaded.

The `ExceptionsTree` ruby gem provides adds both a rake task and a script which
allows developers to see the Exceptions hierarchy configured for the
application.   If the application is based on Rails, this gem uses `railties`
to tie in the rake task correctly.  However, this gem also works fine with ruby
scripts that are not Rails based.

The rake task is done with:

    bundle exec rake exceptions

The script is invoked:

    display_exceptions

The output can be quite long, as many applications have lots of gems that
insert their own exceptions to the hierarchy. Of course, if you are searching
for a particular exception, you can pipe the output through `grep` to find it.
For example:

    display_exceptions | grep IO    # _to find the IO exceptions_

## Installation

Add this line to your application's `Gemfile`:

```ruby
gem 'exceptions_tree'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install exceptions_tree

## Usage

    bundle exec rake exceptions

    display_exceptions

## Development

After checking out the repo, run `bin/setup` to install dependencies. You can
also run `bin/console` for an interactive prompt that will allow you to
experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To
release a new version, update the version number in `version.rb`, and then run
`bundle exec rake release`, which will create a git tag for the version, push
git commits and tags, and push the `.gem` file to
[rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at
https://github.com/aks/exceptions_tree. This project is intended to be
a safe, welcoming space for collaboration, and contributors are expected to
adhere to the [Contributor Covenant](http://contributor-covenant.org) code of
conduct.

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

