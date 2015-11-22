class HashIsh
  module SymbolizeKeys
    def symbolize(unsymbolized_hash)
      {}.tap do |symbolized_hash|
        unsymbolized_hash.each_pair do |unsymbolized_key, value|
          symbolized_key                  = unsymbolized_key.to_sym
          symbolized_hash[symbolized_key] = value
        end
      end
    end

    extend self
  end
end
