require 'json'
require 'srm'
require 'hash_ish/version'
require 'hash_ish/add_default_values'
require 'hash_ish/add_instance_methods'

class HashIsh
  def initialize(kwargs = {}, defaults = {})
    @hash = AddDefaultValues.new.add(kwargs, defaults)
    decorate_self(self, @hash)
  end

  def [](key)
    @hash[key]
  end

  def to_hash
    @hash
  end

  def to_json
    to_hash.to_json
  end

  alias :to_h :to_hash

  private

  def decorate_self(hash_ish, kwargs)
    hash_ish.tap do |hash_ish|
      AddInstanceMethods.new.add(hash_ish, kwargs)
    end
  end
end
