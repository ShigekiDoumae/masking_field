# MaskingField

This gem is data masking.

## Installation

```ruby
gem 'masking_field'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install masking_field

## Usage
It's plain.
```ruby
class User < ApplicationRecord
  masking_to :phone_number
end

User.first.phone_number #=>"**********"
```

String fixed.
```ruby
class User < ApplicationRecord
  masking_to :phone_number, fixed: "000-0000-0000"
end

User.first.phone_number #=>"000-0000-0000"
```

Auto generate to random strings.
`gen_type` is required.type is `lowercase`,`uppercase` and `integer`
`gen_length` is not required. default is 10.
```ruby
class User < ApplicationRecord
  masking_to :phone_number, gen_type: "lowercase", gen_length: 5
end

User.first.phone_number #=>"bfugj" it's random!
```


## Development

After checking out the repo, run `bin/setup` to install dependencies. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/masking_field.
