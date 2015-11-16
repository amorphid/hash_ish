class HashIsh
  class AddInstanceMethods
    def add(hash_ish, kwargs)
      kwargs.each do |key, value|
        define_method(hash_ish, key, value)
      end
    end

    def define_method(hash_ish, name, value)
      return_value = method_value(value)

      hash_ish.send(:define_singleton_method, name) do
        return_value
      end
    end

    def hash_ish(hash)
      HashIsh.new(hash)
    end

    def has_keys?(value)
      value.keys.size > 0
    end

    def should_be_a_hash_ish?(value)
      Srm.is_a_hash?(value) && has_keys?(value)
    end

    def method_value(value)
      should_be_a_hash_ish?(value) ? hash_ish(value) : value
    end
  end
end
