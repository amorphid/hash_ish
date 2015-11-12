require 'hash_ish/version'
require 'hash_ish/add_instance_methods'

class HashIsh
  def self.new(kwargs = {})
    instance(
      decorate_klass(hash_sub_class, kwargs))
  end

  def self.decorate_klass(klass, kwargs)
    klass.tap do |klass|
      AddInstanceMethods.new.add(klass, kwargs)
    end
  end

  def self.instance(klass)
    klass.new
  end

  def self.hash_sub_class
    Class.new(Hash)
  end
end
