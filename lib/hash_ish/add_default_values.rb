class HashIsh
  module AddDefaultValues
    def self.add(kwargs, defaults)
      hash = kwargs.dup

      hash.tap do |hash|
        add_defaults(hash, defaults)
      end
    end

    def self.add_defaults(hash, defaults)
      defaults.each do |key, value|


        if Srm.is_a_hash?(value)
          arg_hash = hash[key] || {}
          hash[key] = AddDefaultValues.add(arg_hash, value)
        else
          hash[key] ||= value
        end
      end
    end
  end
end
