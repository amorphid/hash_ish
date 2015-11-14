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

    def is_a_hash?(object)
      object.is_a? Hash
    end

    def hash_ish(hash)
      HashIsh.new(hash)
    end

    def method_value(value)
      is_a_hash?(value) ? hash_ish(value) : value
    end
  end
end
