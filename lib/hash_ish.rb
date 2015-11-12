require "hash_ish/version"

class HashIsh
  def initialize(kwargs = {})
    AddInstanceMethods.new.add(self, kwargs)
  end
end
