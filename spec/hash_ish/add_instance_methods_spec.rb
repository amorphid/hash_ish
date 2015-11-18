require 'spec_helper'

describe HashIsh::AddInstanceMethods do
  let(:adder) { described_class }
  let(:hash_ish) { HashIsh.new }

  context '#add' do
    it 'to change by 0' do
      expect { adder.add(hash_ish, {}) }.
        to change { hash_ish.methods.length }.
        by(0)
    end

    it 'to change by 1' do
      expect { adder.add(hash_ish, { a: 1 }) }.
        to change { hash_ish.methods.length }.
        by(1)
    end

    it 'to change by 2' do
      expect { adder.add(hash_ish, { a: 1, b: 2 }) }.
        to change { hash_ish.methods.length }.
        by(2)
    end
  end

  context '#hash_ish' do
    it 'to be a HashIsh' do
      expect(adder.hash_ish({})).
        to be_instance_of(HashIsh)
    end
  end
end
