# Jekyll::GoogleAnalytics [![Build Status](https://travis-ci.org/everypolitician/jekyll-google_analytics.svg?branch=master)](https://travis-ci.org/everypolitician/jekyll-google_analytics) [![Gem Version](https://badge.fury.io/rb/jekyll-google_analytics.svg)](https://badge.fury.io/rb/jekyll-google_analytics)

Add Google Analytics to your Jekyll site.

## Installation

Add this line to your application's Gemfile:

```ruby
group :jekyll_plugins do
  gem 'jekyll-google_analytics'
end
```

And then execute:

    $ bundle

Or install it yourself and add it to your `_config.yml` manually.

    $ gem install jekyll-google_analytics

## Usage

First add your tracking code to `_config.yml`. You can find out your tracking code by [following these instructions](https://support.google.com/analytics/answer/1008080?hl=en#GA).

```yaml
google_analytics:
  tracking_code: UA-99999999-9 # Replace this with your actual tracking code
```

Then add the following tag after the `<body>` tag on any pages you want to be tracked in Google Analytics. You probably want it on every page, so putting it in a shared layout is ideal.

```liquid
{% google_analytics %}
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake test` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/everypolitician/jekyll-google_analytics.

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
