# N2W

--Convert numeric data into friendly, human-like verbal expressions that match 
the occasion!

N2W or number_to_word, is a ruby gem that allows you to transform numeric data 
into verbal expressions. 

The way that we express numbers verbally (or the way that we choose to iterate 
phonetically numerical data --whatever you prefer!) differs from one occasion 
to another, according to our intention and purpose. This ruby gem is all about 
giving your rails app, the ability to express large volumes of numerical data in
words, in a way that sounds more natural. 

This might be useful to people for example who have a large database of phone 
numbers and they use .erb and tts technology in order to communicate this information 
with their clients. This might be also useful to people who work with educational tts 
resources and they want to have scientific data (float readings, co-ordinates or 
no. of pages) read out loud during a presentation, in a more human-like manner 
than a single digit after the other.   

Finally, this might be useful in order to communicate various other data types with a more 
or less standard format, like zips post codes, ISBN's and twelve || sixteen digit 
activation tokens. 

This facility already includes class methods for the explicit expression of the following 
numerical data structures and is scheduled to feature the options marked with a # in 
the near future: 

Integers (0..999*10**48), takes either a string or an integer.
--Soon to come: Floats/Scientific measurements
Telephone numbers (international, local, mobile and 800 numbers)-->this feature uses 
regexes to discover phonetic patterns in your data to make tel numbers more memorable! 
--Soon to come: Zips && Post Codes 
--Soon to come: Pages
--Soon to come: Checks
--Soon to come: Co-ordinates 
--Soon to come: ISBNs
--Soon to come: Pay_as_you_go mobile telephony activation codes
--Soon to come: An explaining facility on how big is that number, with examples drawn by science ##feel free to contribute on this one as long as you are willing and 
able to cross-reference!

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'n_2_w'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install n_2_w

## Usage

Simply require N2W/Spint and call any_other on any integer or string/integer of ur choice. 

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/n_2_w. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

