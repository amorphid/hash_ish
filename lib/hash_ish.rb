require 'json'
require 'srm'
require 'hash_ish/version'
# ?require 'hash_ish/override_falsey_data'
# require 'hash_ish/add_instance_methods'

class HashIsh
  def initialize(data = {}, overrides = {})
    @hash = data.tap do |hash|
      hash.each_pair do |key, data|
        if Srm.is_a_hash?(data)
          hash[key] = (overrides.member? key) ? HashIsh.new(data, overrides[key]) : HashIsh.new(data)
        end
      end
    end
  end

  def method_missing(key)
    if @hash.member? key
      @hash[key]
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
