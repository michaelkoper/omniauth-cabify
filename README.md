# OmniAuth Cabify

This is the official OmniAuth strategy for authenticating to Cabify. To
use it, you'll need to be a Cabify admin :-)

## Basic Usage

    use OmniAuth::Builder do
      provider :cabify, ENV['CABIFY_KEY'], ENV['CABIFY_SECRET']
    end




## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
