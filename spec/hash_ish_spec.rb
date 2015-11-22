require 'spec_helper'

describe HashIsh do
  let(:hash) do
    {
      a: 'b',
      c: { d: 'e' },
      f: {},
      'g' => 'h'
    }
  end

  subject { described_class.new(hash) }

  it { expect(subject.a).to eq(hash[:a]) }

  it { expect { subject.a = '' }.to raise_error(NoMethodError) }

  it { expect { (subject[:a]) }.to raise_error(NoMethodError) }

  it { expect { subject[:a] = '' }.to raise_error(NoMethodError) }

  it { expect(subject.c).to be_instance_of(described_class) }

  it { expect(subject.c.d).to eq(hash[:c][:d]) }

  it { expect(subject.f).to eq(hash[:f]) }

  it { expect(subject.f).to be_instance_of(Hash) }

  it { expect(subject.g).to eq(hash['g']) }

  context '#.to_hash' do
    let(:hash_ish) { HashIsh.new({a: 1, "b" => 2}) }

    it { expect(hash_ish.to_hash).to eq({a: 1, b: 2}) }
    it { expect(hash_ish.to_h).to eq({a: 1, b: 2}) }
  end

  context '#to_json' do
    it { expect(subject.to_json).to eq(hash.to_json) }
  end
end
