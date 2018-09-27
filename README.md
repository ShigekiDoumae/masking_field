# MaskingField

This gem is data masking.

## Installation

```ruby
gem 'masking_field',git: "git@github.com:ShigekiDoumae/masking_field.git"
```

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
