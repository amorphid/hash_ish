class HashIsh
  module OverrideFalseyDataUsingSchema
    def self.override(outer_data, schema)
      outer_data.tap do |outer_data|
        override_falsey_data(outer_data, schema)
      end
    end

    def self.override_falsey_data(outer_data, schema)
      schema.each_pair do |schema_key, schema_value|
        if Srm.is_a_hash?(schema_value)
          may_be_hash = outer_data[schema_key]
          inner_data  = Srm.is_a_hash?(may_be_hash) ?  may_be_hash : {}
          outer_data[schema_key] = OverrideFalseyDataUsingSchema.override(inner_data, schema_value)
        else
          outer_data[schema_key] ||= schema_value
        end
      end
    end
  end
end
