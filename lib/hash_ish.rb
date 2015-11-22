require 'json'
require 'srm'
require 'hash_ish/version'
require 'hash_ish/override_falsey_data_using_schema'

class HashIsh
  def initialize(data = {}, schema = {})
    data_with_symbolized_keys = if data.keys.reject { |key| key.is_a? String }.empty?
      data
    else
        {}.tap do |hash|
        data.each_pair do |key, value|
          symbolized_key = (key.is_a? Symbol) ? key : key.to_sym
          hash[symbolized_key] = value
        end
      end
    end

    @hash = OverrideFalseyDataUsingSchema
            .override(data_with_symbolized_keys, schema)
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
