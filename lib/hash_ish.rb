require 'json'
require 'srm'
require 'hash_ish/version'
require 'hash_ish/override_falsey_data_using_schema'

class HashIsh
  def initialize(data = {}, schema = {})
    @hash = OverrideFalseyDataUsingSchema.override(data, schema)
  end

  def method_missing(key, args = [], _ = nil, &block)
    if @hash.member? key
      value = @hash[key]

      if Srm.is_a_hash?(value) && value.length > 0
         HashIsh.new(value)
      else
        value
      end
    else
      raise(NoMethodError, "undefined method `#{key}' for #{self.to_s}")
    end
  end

  def to_hash
    @hash
  end

  def to_json
    to_hash.to_json
  end

  alias :to_h :to_hash
end
