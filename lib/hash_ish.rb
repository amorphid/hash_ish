require 'json'
require 'srm'
require 'hash_ish/version'
require 'hash_ish/override_falsey_data_using_schema'
require 'hash_ish/symbolize_keys'

class HashIsh
  def initialize(data = {}, schema = {})
    symbolized = SymbolizeKeys.symbolize(data)

    @hash = OverrideFalseyDataUsingSchema
            .override(symbolized, schema)
  end

  def method_missing(key, _args = [], _ = nil, &_block)
    if @hash.member? key
      value = @hash[key]

      if Srm.is_a_hash?(value) && value.length > 0
        HashIsh.new(value)
      else
        value
      end
    else
      fail(NoMethodError, "undefined method `#{key}' for #{self}")
    end
  end

  def to_hash
    @hash
  end

  def to_json
    to_hash.to_json
  end

  alias_method :to_h, :to_hash
end
