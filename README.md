# colos

[![Gem version](https://badge.fury.io/rb/colos.png)](https://rubygems.org/gems/colos)
[![Build Status](https://secure.travis-ci.org/artemeff/colos.png)](https://travis-ci.org/artemeff/colos)
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

# set rgb option
colos.options[:format] = :rgb

# and get it
color.color "word"        # => [57, 94, 154]
color.ip "173.194.32.14"  # => [173, 194, 32]
```

### Options

```ruby
default_options = {
  frequency: 1.4, # frequency for strings
  randomizr: 0,   # number of item from possible ip colors
  format:    :hex # :hex or :rgb
}
```

### Copyright

Copyright (c) 2012 Yuri Artemev. See LICENSE.txt for further details.
