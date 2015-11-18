require 'set'

class HashIsh
  module AddInstanceMethods
    FORBIDDEN_KEYS = {
      __id__:                     true,
      __send__:                   true,
      initialize:                 true,
      inspect:                    true,
      methods:                    true,
      object_id:                  true,
      singleton_method_undefined: true
    }.freeze

    def self.add(hash_ish, kwargs)
      kwargs.each do |key, value|
        raise "the roof" if FORBIDDEN_KEYS[key]
        return_value = method_value(value)
        define_method(hash_ish, key) { return_value }
      end
    end

    def self.define_method(hash_ish, name, &value)
      define_singleton_method = hash_ish.method(:define_singleton_method)
      define_singleton_method.call(name, value)
    end

    def self.hash_ish(hash)
      HashIsh.new(hash)
    end

    def self.should_be_a_hash_ish?(value)
      Srm.is_a_hash?(value) && Srm::Hash.is_not_empty?(value)
    end

    def self.method_value(value)
      should_be_a_hash_ish?(value) ? hash_ish(value) : value
    end
  end
end
