class HashIsh
  module VetMethodName
    def method_missing(*args)
      binding.pry
    end

    def vet(key)
      begin
        self.send(key)
      rescue
        raise MethodNameError, "`#{key}' is not a valid method name"
      end
    end

    extend self
  end
end
