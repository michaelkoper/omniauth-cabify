# OmniAuth Cabify [![Build Status](https://travis-ci.org/minifast/omniauth-cabify.svg?branch=master)](https://travis-ci.org/minifast/omniauth-cabify) [![Code Climate](https://codeclimate.com/github/minifast/omniauth-cabify/badges/gpa.svg)](https://codeclimate.com/github/minifast/omniauth-cabify)

This is the official OmniAuth strategy for authenticating to Cabify. To
use it, you'll need to be a Cabify admin :-)

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'omniauth-cabify'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install omniauth-cabify

## Usage

Add the following to your `config/initializers/omniauth.rb` or similar:

```
  use OmniAuth::Builder do
    provider :cabify, ENV['CABIFY_APP_ID'], ENV['CABIFY_APP_SECRET']
  end
```

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
