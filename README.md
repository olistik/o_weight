# OWeight

Olistik version of a weight related PORO.

## Installation

Add this line to your application's Gemfile:

    gem 'o_weight', git: 'https://github.com/olistik/o_weight.git'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install o_weight

## Usage

```ruby
require 'o_weight'
w1 = OWeight.new(value: 3)
puts w1 # 3.0 gram
puts w1 + 5 # 8.0 gram
puts w1.to_unit(:dekagram) # 0.3 dekagram
puts 10.to_kilogram # 10.0 kilogram
w2 = 3.to_gram + 10.to_kilogram
puts w2 # 10003.0 gram
(6.to_kilogram / 4).to_s # => "1.5 kilogram"
```

## Contributing

1. Fork it ( https://github.com/[my-github-username]/o_weight/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
