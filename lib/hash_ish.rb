require 'hash_ish/version'
require 'hash_ish/add_default_values'
require 'hash_ish/add_instance_methods'

class HashIsh < Hash
  def initialize(kwargs = {}, defaults = {})
    default_kwargs = AddDefaultValues.new.add(kwargs, defaults)
    decorate_self(self, default_kwargs)
  end

  def decorate_self(hash_ish, kwargs)
    hash_ish.tap do |hash_ish|
      AddInstanceMethods.new.add(hash_ish, kwargs)
    end
  end
end
