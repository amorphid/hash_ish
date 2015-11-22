require 'spec_helper'

class HashIsh
  describe SymbolizeKeys do
    subject { described_class }

    context '#symbolize' do
      it 'returns hash with symbolized keys' do
        unsymbolized = { "a" => 1, "b" => 2, "c" => 3 }
        symbolized   = { a: 1, b: 2, c: 3 }
        result       = subject.symbolize(unsymbolized)
        expect(result).to eq(symbolized)
      end
    end
  end
end
