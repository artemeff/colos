# colos

[![Dependency Status](https://gemnasium.com/artemeff/colos.png)](https://gemnasium.com/artemeff/colos)

Convert ruby string to color.

### Install

    gem install colos

### Usage

```ruby
require 'colos'

colos = Colos.new frequency: 1.4, randomizr: 5

# get one of possible colors from string
colos.color "word"        # => "395e9a"

# get all possible colors
colos.colors "word"       # => ["b7d989", "395e9a", "14e8c0"]

# get one of possible colors from IPv4
colos.ip "173.194.32.14"  # => "ad0e20"

# get all colors from IPv4
colos.ips "173.194.32.14" # => ["adc220", ..., "0e20c2"]
```

### Options

```ruby
default_options = {
  hash: CityHash, # doesn't work at now
  frequency: 1.4, # frequency for strings
  randomizr: 0    # number of item from possible ip colors
}
```

### Copyright

Copyright (c) 2012 Yuri Artemev. See LICENSE.txt for further details.
