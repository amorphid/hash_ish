class HashIsh
  module OverrideFalseyData
    def self.override(data, overrides)
      overrides.map do |key, override|
        Srm.is_a_hash?(value)
      end
    end

    def self.add_defaults(hash, defaults)
      defaults.each do |key, value|


        if
          arg_hash = hash[key] || {}
          hash[key] = AddDefaultValues.add(arg_hash, value)
        else
          hash[key] ||= value
        end
      end
    end
  end
end
