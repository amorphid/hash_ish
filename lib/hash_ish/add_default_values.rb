class HashIsh
  class AddDefaultValues
    def add(kwargs, defaults)
      hash = kwargs.dup

      hash.tap do |hash|
        add_defaults(hash, defaults)
      end
    end

    def add_defaults(hash, defaults)
      defaults.each do |key, value|
        if is_a_hash?(value)
          arg_hash = hash[key] || {}
          hash[key] = AddDefaultValues.new.add(arg_hash, value)
        else
          hash[key] ||= value
        end
      end
    end

    def truthy?(hash, key)
      !!hash[key]
    end

    def is_a_hash?(object)
      object.is_a? Hash
    end
  end
end

# puts AddDefaultValues.new.add({}, { a: 1 }).inspect
# puts AddDefaultValues.new.add({a: 2}, { a: 1 }).inspect
# puts AddDefaultValues.new.add({a: 2}, { a: 1, b: 1 }).inspect
# puts AddDefaultValues.new.add({ a: { b: nil }}, { a: { b: 1 } }).inspect
# puts AddDefaultValues.new.add({ a: { b: 2 }}, { a: { b: 1 } }).inspect
# puts AddDefaultValues.new.add({ a: { b: false }, c: { d: true }}, { a: { b: 1 }, c: { d: 123} }).inspect
