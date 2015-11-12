require 'hash_ish/version'
require 'hash_ish/add_instance_methods'

class HashIsh
  def self.new(kwargs = {})
    instance(
      decorate_klass(kwargs))
  end

  def self.instance(klass)
    klass.new
  end

  def self.decorate_klass(kwargs)
    Class.new.tap do |klass|
      AddInstanceMethods.new.add(klass, kwargs)
    end
  end
end
