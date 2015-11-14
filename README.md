# HashIsh

- A [Hashie::Mash](https://github.com/intridea/hashie#mash) knockoff
- This is a prototype
- Built and tested with Ruby 2.2.3

## Setup

Add it to your Gemfile or...

```
gem install hash_ish
```

## Test

```
bundle exec rspec
```

## Usage

```
require 'hash_ish'

# access hash keys with method calls
hash     = { a: 'b', c: { d: 'e' }, f: {} }
hash_ish = HashIsh.new(hash)
hash_ish.a         # returns 'b'
hash_ish.a = ''    # raises NoMethodError
hash_ish[:a]       # returns 'b'
hash_ish[:a] = ''  # raises NoMethodError
hash_ish.c         # returns instance of HashIsh w/ hash of { d: 'e' }
hash_ish.c.class   # returns HashIsh
hash_ish[:c]       # returns { d: 'e' }
hash_ish[:c].class # returns Hash
hash_ish.c.d       # returns 'e'
hash_ish.f         # returns {}
hash_ish.f.class   # returns Hash
hash_ish[:f]       # returns {}
hash_ish[:f].class # returns Hash

# set default values
hash     = { a: nil, b: { c: false }, d: { e: '>_<' } }
defaults = { a: 123, b: { c: true  }, d: { e: 'ಠ_ಠ' } }
hash_ish = HashIsh.new(hash, defaults)
hash_ish.a   # returns 123,  overrides falsey nil
hash_ish.b.c # returns true, overrides falsey false
hash_ish.d.e # returns 'lol', not overriden due to 'lol' being truthy
```

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
