# HashIsh

- A [Hashie::Mash](https://github.com/intridea/hashie#mash) knockoff
- This is a prototype
- Built and tested with Ruby 2.2.3

## Setup

Add it to your Gemfile or...

```
gem install hash_ish
```

## Usage

```
require 'hash_ish'

# insert hash into new hash_ish
hash     = { a { b: "c" } }
hash_ish = HashIsh.new(hash)

# access hash keys with method calls
hash_ish.a.b # returns 'c'
```


## Known issues

- currently only supports hash keys that would be valid method names

```
# this works
HashIsh.new(foo: "bar").foo # bar

# this blows up
HashIsh.new(123 => 456)
```

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
