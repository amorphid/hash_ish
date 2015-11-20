require 'json'
require 'srm'
require 'hash_ish/version'
require 'hash_ish/add_default_values'
require 'hash_ish/add_instance_methods'

class HashIsh
  def initialize(data = {}, overrides = {})
    @hash = OverrideFalseyData.override(kwargs, overrides)
    @keys = {}.tap { |keys| @hash.each_pair { }}
  end

  def method_missing(key)
    @

    if @hash_cache.member? :key
      keys
      @keys_cache
      @hash[key]
  end

  def to_hash
    @hash
  end

  def to_json
    to_hash.to_json
  end

  alias :to_h :to_hash
end
