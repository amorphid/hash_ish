class HashIsh
  class AddInstanceMethods
    def add(klass, kwargs)
      kwargs.each do |key, value|
        define_method(klass, key, value)
      end
    end

    def define_method(klass, name, value)
      return_value = method_value(value)

      klass.send(:define_method, name) do
        return_value
      end
    end

    def hash?(object)
      object.is_a? Hash
    end

    def hash_ish(value)
      HashIsh.new(value)
    end

    def method_value(value)
      hash?(value) ? hash_ish(value) : value
    end
  end
end
